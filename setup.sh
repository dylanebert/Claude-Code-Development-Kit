#!/usr/bin/env bash

# Claude Code Development Kit Setup Script
# 
# This script installs the Claude Code Development Kit into a target project,
# providing automated context management for Claude Code.

set -euo pipefail

# Script directory (where this script lives)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration variables
TARGET_DIR=""
INSTALL_CONTEXT7="n"
OVERWRITE_ALL="n"
SKIP_ALL="n"

# Print colored output
print_color() {
    local color=$1
    shift
    echo -e "${color}$@${NC}"
}

# Print header
print_header() {
    echo
    print_color "$BLUE" "==========================================="
    print_color "$BLUE" "   Claude Code Development Kit Setup"
    print_color "$BLUE" "==========================================="
    echo
}

# Safe read function that works in piped contexts
# Usage: safe_read <variable_name> <prompt_string>
safe_read() {
    local var_name="$1"
    local prompt="$2"
    local temp_input  # Renamed to avoid scope collision

    # Check if a TTY is available for interactive input
    if [ ! -t 0 ] && [ ! -c /dev/tty ]; then
        print_color "$RED" "❌ Cannot prompt for input: No TTY available."
        return 1
    fi

    # Determine the input source
    local input_source
    if [ -t 0 ]; then
        input_source="/dev/stdin" # Standard input is the terminal
    else
        input_source="/dev/tty"   # Standard input is piped, use the terminal
    fi

    # Use read -p for the prompt. The prompt is sent to stderr by default
    # when reading from a source other than the terminal, so it's visible.
    read -r -p "$prompt" temp_input < "$input_source"

    # Assign the value to the variable name passed as the first argument
    # using `printf -v`. This is a safer way to do indirect assignment.
    printf -v "$var_name" '%s' "$temp_input"
}

# Safe read function for yes/no questions with validation
# Usage: safe_read_yn <variable_name> <prompt_string>
safe_read_yn() {
    local var_name="$1"
    local prompt="$2"
    local user_input
    local sanitized_input
    local valid_input=false

    while [ "$valid_input" = false ]; do
        if ! safe_read user_input "$prompt"; then
            return 1
        fi

        # Sanitize input: remove carriage returns and whitespace
        sanitized_input="${user_input//$'\r'/}"  # Remove \r
        sanitized_input="$(echo "$sanitized_input" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')"

        case "$sanitized_input" in
            y|n)
                valid_input=true
                printf -v "$var_name" '%s' "$sanitized_input"
                ;;
            *)
                print_color "$YELLOW" "Please enter 'y' for yes or 'n' for no."
                ;;
        esac
    done
}

# Safe read function for file conflict choices with validation
# Usage: safe_read_conflict <variable_name>
safe_read_conflict() {
    local var_name="$1"
    local user_input
    local sanitized_input
    local valid_input=false

    while [ "$valid_input" = false ]; do
        if ! safe_read user_input "   Your choice: "; then
            return 1
        fi

        # Sanitize input: remove carriage returns and whitespace
        sanitized_input="${user_input//$'\r'/}"  # Remove \r
        sanitized_input="$(echo "$sanitized_input" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')"

        case "$sanitized_input" in
            o|s|a|n)
                valid_input=true
                printf -v "$var_name" '%s' "$sanitized_input"
                ;;
            *)
                print_color "$YELLOW" "   Invalid choice. Please enter o, s, a, or n."
                ;;
        esac
    done
}

# Check if Claude Code is installed
check_claude_code() {
    print_color "$YELLOW" "Checking prerequisites..."
    
    if ! command -v claude &> /dev/null; then
        print_color "$RED" "❌ Claude Code is not installed or not in PATH"
        echo "Please install Claude Code from: https://github.com/anthropics/claude-code"
        echo "After installation, make sure 'claude' command is available in your terminal"
        exit 1
    fi
    
    print_color "$GREEN" "✓ Claude Code is installed"
}

# Check for required tools
check_required_tools() {
    local missing_tools=()
    
    for tool in grep cat mkdir cp; do
        if ! command -v "$tool" &> /dev/null; then
            missing_tools+=("$tool")
        fi
    done
    
    if [ ${#missing_tools[@]} -ne 0 ]; then
        print_color "$RED" "❌ Missing required tools: ${missing_tools[*]}"
        echo
        echo "These tools are needed for:"
        echo "  • grep   - Search and filter file contents"
        echo "  • cat    - Read and display files"
        echo "  • mkdir  - Create directory structure"
        echo "  • cp     - Copy framework files"
        echo
        echo "On macOS: These are pre-installed"
        echo "On Ubuntu/Debian: sudo apt-get install ${missing_tools[*]}"
        echo "On other systems: Use your package manager to install these tools"
        exit 1
    fi
    
    print_color "$GREEN" "✓ All required tools are available"
}

# Get target directory
get_target_directory() {
    echo
    print_color "$YELLOW" "Where would you like to install the Claude Code Development Kit?"
    local prompt="Enter target project directory (or . for current directory): "
    if ! safe_read input_dir "$prompt"; then
        exit 1
    fi
    
    if [ "$input_dir" = "." ]; then
        # If run from installer, use the original directory
        if [ -n "${INSTALLER_ORIGINAL_PWD:-}" ]; then
            TARGET_DIR="$INSTALLER_ORIGINAL_PWD"
        else
            # Otherwise use current directory (for manual runs)
            TARGET_DIR="$(pwd)"
        fi
    else
        TARGET_DIR="$(cd "$input_dir" 2>/dev/null && pwd)" || {
            print_color "$RED" "❌ Directory '$input_dir' does not exist"
            exit 1
        }
    fi
    
    # Check if target is the framework source directory
    if [ "$TARGET_DIR" = "$SCRIPT_DIR" ]; then
        print_color "$RED" "❌ Cannot install framework into its own source directory"
        echo "Please choose a different target directory"
        exit 1
    fi
    
    print_color "$GREEN" "✓ Target directory: $TARGET_DIR"
}

# Prompt for optional components
prompt_optional_components() {
    echo
    print_color "$YELLOW" "Optional Components:"
    echo
    
    # Context7 MCP
    print_color "$CYAN" "Context7 MCP Server (Recommended)"
    echo "  Provides up-to-date documentation for external libraries (React, FastAPI, etc.)"
    if ! safe_read_yn INSTALL_CONTEXT7 "  Install Context7 integration? (y/n): "; then
        exit 1
    fi
    echo
}

# Create directory structure
create_directories() {
    print_color "$YELLOW" "Creating directory structure..."
    
    # Main directories
    mkdir -p "$TARGET_DIR/.claude/commands"
    mkdir -p "$TARGET_DIR/docs/ai-context"
    mkdir -p "$TARGET_DIR/docs/open-issues"
    mkdir -p "$TARGET_DIR/docs/specs"
    
    print_color "$GREEN" "✓ Directory structure created"
}

# Helper function to handle file conflicts
handle_file_conflict() {
    local source_file="$1"
    local dest_file="$2"
    local file_type="$3"
    
    # If policies are already set, apply them
    if [ "$OVERWRITE_ALL" = "y" ]; then
        cp "$source_file" "$dest_file"
        return 0
    elif [ "$SKIP_ALL" = "y" ]; then
        return 1
    fi
    
    # Show conflict and ask user
    print_color "$YELLOW" "⚠️  File already exists: $(basename "$dest_file")"
    echo "   Type: $file_type"
    echo "   Location: $dest_file"
    echo
    echo "   What would you like to do?"
    echo "   [o] Overwrite - Replace the existing file with the new one"
    echo "   [s] Skip - Keep the existing file, don't copy the new one"
    echo "   [a] Always overwrite - Replace this and all future existing files"
    echo "   [n] Never overwrite - Skip this and all future existing files"
    echo
    if ! safe_read_conflict choice; then
        return 1
    fi
    
    case "$choice" in
        o)
            cp "$source_file" "$dest_file"
            print_color "$GREEN" "   ✓ Overwritten"
            return 0
            ;;
        s)
            print_color "$YELLOW" "   → Skipped"
            return 1
            ;;
        a)
            OVERWRITE_ALL="y"
            cp "$source_file" "$dest_file"
            print_color "$GREEN" "   ✓ Overwritten (will automatically overwrite all future conflicts)"
            return 0
            ;;
        n)
            SKIP_ALL="y"
            print_color "$YELLOW" "   → Skipped (will automatically skip all future conflicts)"
            return 1
            ;;
        *)
            print_color "$RED" "   Invalid choice, skipping file"
            return 1
            ;;
    esac
}

# Copy a file with conflict handling
copy_with_check() {
    local source="$1"
    local dest="$2"
    local file_type="$3"
    
    if [ -f "$dest" ]; then
        handle_file_conflict "$source" "$dest" "$file_type"
    else
        cp "$source" "$dest"
    fi
}

# Copy framework files
copy_framework_files() {
    print_color "$YELLOW" "Copying framework files..."
    echo
    
    # Copy commands (excluding gemini-consult.md)
    if [ -d "$SCRIPT_DIR/commands" ]; then
        for cmd in "$SCRIPT_DIR/commands/"*.md; do
            if [ -f "$cmd" ]; then
                basename_cmd="$(basename "$cmd")"
                dest="$TARGET_DIR/.claude/commands/$basename_cmd"
                copy_with_check "$cmd" "$dest" "Command template"
            fi
        done
    fi
    
    # Copy documentation structure
    if [ -d "$SCRIPT_DIR/docs" ]; then
        # Copy ai-context files
        if [ -d "$SCRIPT_DIR/docs/ai-context" ]; then
            for doc in "$SCRIPT_DIR/docs/ai-context/"*.md; do
                if [ -f "$doc" ]; then
                    dest="$TARGET_DIR/docs/ai-context/$(basename "$doc")"
                    copy_with_check "$doc" "$dest" "AI context documentation"
                fi
            done
        fi
        
        # Copy example issues
        if [ -d "$SCRIPT_DIR/docs/open-issues" ]; then
            for issue in "$SCRIPT_DIR/docs/open-issues/"*.md; do
                if [ -f "$issue" ]; then
                    dest="$TARGET_DIR/docs/open-issues/$(basename "$issue")"
                    copy_with_check "$issue" "$dest" "Issue template"
                fi
            done
        fi
        
        # Copy spec templates
        if [ -d "$SCRIPT_DIR/docs/specs" ]; then
            for spec in "$SCRIPT_DIR/docs/specs/"*.md; do
                if [ -f "$spec" ]; then
                    dest="$TARGET_DIR/docs/specs/$(basename "$spec")"
                    copy_with_check "$spec" "$dest" "Specification template"
                fi
            done
        fi
        
        # Copy docs README
        if [ -f "$SCRIPT_DIR/docs/README.md" ]; then
            copy_with_check "$SCRIPT_DIR/docs/README.md" \
                          "$TARGET_DIR/docs/README.md" \
                          "Documentation guide"
        fi
        
        # Copy CONTEXT template files
        if [ -f "$SCRIPT_DIR/docs/CONTEXT-tier2-component.md" ]; then
            copy_with_check "$SCRIPT_DIR/docs/CONTEXT-tier2-component.md" \
                          "$TARGET_DIR/docs/CONTEXT-tier2-component.md" \
                          "Tier 2 documentation template"
        fi
        
        if [ -f "$SCRIPT_DIR/docs/CONTEXT-tier3-feature.md" ]; then
            copy_with_check "$SCRIPT_DIR/docs/CONTEXT-tier3-feature.md" \
                          "$TARGET_DIR/docs/CONTEXT-tier3-feature.md" \
                          "Tier 3 documentation template"
        fi
    fi
    
    # Create CLAUDE.md from template if it doesn't exist
    if [ ! -f "$TARGET_DIR/CLAUDE.md" ] && [ -f "$SCRIPT_DIR/docs/CLAUDE.md" ]; then
        cp "$SCRIPT_DIR/docs/CLAUDE.md" "$TARGET_DIR/CLAUDE.md"
        print_color "$GREEN" "✓ Created CLAUDE.md from template"
    else
        if [ -f "$TARGET_DIR/CLAUDE.md" ]; then
            print_color "$YELLOW" "→ Preserved existing CLAUDE.md"
        fi
    fi
    
    print_color "$GREEN" "✓ Framework files copied"
}

# Display Context7 MCP server information
display_context7_info() {
    if [ "$INSTALL_CONTEXT7" = "y" ]; then
        echo
        print_color "$BLUE" "=== Context7 MCP Server Setup (Optional) ==="
        echo
        echo "To use Context7 MCP integration, you need to install the Context7 MCP server:"
        echo
        print_color "$YELLOW" "Context7 MCP Server:"
        echo "  Repository: https://github.com/upstash/context7"
        echo "  Documentation: See the Context7 README for setup instructions"
        echo
        echo "After installing Context7, add its configuration to your Claude Code settings."
    fi
}

# Show next steps
show_next_steps() {
    echo
    print_color "$GREEN" "=== Installation Complete! ==="
    echo
    print_color "$YELLOW" "Next Steps:"
    echo
    
    echo "1. Customize your project context:"
    echo "   - Edit: $TARGET_DIR/CLAUDE.md"
    echo "   - Update project structure in: $TARGET_DIR/docs/ai-context/project-structure.md"
    echo
    
    echo "2. Test your installation:"
    echo "   - Run: claude"
    echo "   - Then: /full-context \"analyze my project structure\""
    echo
    
    echo "3. Documentation Templates:"
    print_color "$CYAN" "   The framework includes documentation templates:"
    echo "   - $TARGET_DIR/docs/CONTEXT-tier2-component.md"
    echo "   - $TARGET_DIR/docs/CONTEXT-tier3-feature.md"
    echo
    echo "   These are TEMPLATES. To use them:"
    echo "   • Copy to your component/feature directories and rename to CONTEXT.md"
    echo "   • OR use the /create-docs command to generate documentation automatically"
    echo
    
    print_color "$BLUE" "For documentation and examples, see:"
    echo "  - Commands: $TARGET_DIR/.claude/commands/README.md"
    echo "  - Docs: $TARGET_DIR/docs/README.md"
}

# Main execution
main() {
    print_header
    
    # Run checks
    check_claude_code
    check_required_tools
    
    # Get user input
    get_target_directory
    prompt_optional_components
    
    # Confirm installation
    echo
    print_color "$YELLOW" "Ready to install Claude Code Development Kit to:"
    echo "  $TARGET_DIR"
    echo
    if ! safe_read_yn confirm "Continue? (y/n): "; then
        exit 1
    fi
    
    if [ "$confirm" != "y" ]; then
        print_color "$RED" "Installation cancelled"
        exit 0
    fi
    
    # Perform installation
    create_directories
    copy_framework_files
    
    # Show completion information
    display_context7_info
    show_next_steps
}

# Run the script
main "$@"
