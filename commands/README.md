# 🔧 Command Templates

Structured command templates that enable Claude Code to execute complex development workflows through organized, repeatable processes.

## Overview

After reading the [main kit documentation](../README.md), you'll understand how these commands fit into the integrated system. Each command:

- **Auto-loads** the appropriate documentation tier for its task
- **Provides structured workflows** based on complexity 
- **Integrates external services** when additional context helps
- **Maintains documentation** to keep context current

### 🚀 Automatic Context Loading

All commands benefit from automatic context loading:

- **Core documentation auto-loaded**: Every command automatically receives essential project documentation
- **Structured workflows**: Commands follow proven patterns for consistent results
- **Consistent knowledge**: All sessions start with the same foundational understanding

## Available Commands

### 📊 `/full-context`
**Purpose**: Comprehensive context gathering and analysis when you need deep understanding or plan to execute code changes.

**When to use**:
- Starting work on a new feature or bug
- Need to understand how systems interconnect
- Planning architectural changes
- Any task requiring thorough analysis before implementation

**How it works**: Adaptively scales analysis based on request complexity. Reads documentation, analyzes code, maps dependencies, and consults external services as needed.

### 🔍 `/code-review` 
**Purpose**: Get structured analysis of code quality, focusing on high-impact findings rather than nitpicks.

**When to use**:
- After implementing new features
- Before merging important changes
- When you want security, performance, and architecture insights
- Need confidence in code quality

**How it works**: Provides structured analysis covering security, performance, and architectural concerns. Focuses on critical issues that matter for production code.

### 📝 `/update-docs`
**Purpose**: Keep documentation synchronized with code changes, ensuring context remains current.

**When to use**:
- After modifying code
- After adding new features
- When project structure changes
- Following any significant implementation

**How it works**: Analyzes what changed and updates the appropriate CLAUDE.md files across all tiers. Maintains the context that future sessions will rely on.

### 📄 `/create-docs`
**Purpose**: Generate initial documentation structure for existing projects that lack structured documentation.

**When to use**:
- Adopting the framework in an existing project
- Starting documentation from scratch
- Need to document legacy code
- Setting up the 3-tier structure

**How it works**: Analyzes your project structure and creates appropriate CLAUDE.md files at each tier, establishing the foundation for organized development.

### ♻️ `/refactor`
**Purpose**: Intelligently restructure code while maintaining functionality and updating all dependencies.

**When to use**:
- Breaking up large files
- Improving code organization
- Extracting reusable components
- Cleaning up technical debt

**How it works**: Analyzes file structure, maps dependencies, identifies logical split points, and handles all import/export updates across the codebase.

### 🤝 `/handoff`
**Purpose**: Preserve context when ending a session or when the conversation becomes too long.

**When to use**:
- Ending a work session
- Context limit approaching
- Switching between major tasks
- Supplementing `/compact` with permanent storage

**How it works**: Updates the handoff documentation with session achievements, current state, and next steps. Ensures smooth continuation in future sessions.

## Integration Patterns

### Typical Workflow
```bash
/full-context "implement user notifications"    # Understand
# ... implement the feature ...
/code-review "review notification system"       # Validate  
/update-docs "document notification feature"    # Synchronize
/handoff "completed notification system"        # Preserve
```

### Quick Analysis
```bash
/full-context "why is the API slow?"           # Investigate
# ... apply fixes ...
/update-docs "document performance fixes"       # Update context
```

### Major Refactoring
```bash
/full-context "analyze authentication module"   # Understand current state
/refactor "@auth/large-auth-file.ts"          # Restructure
/code-review "review refactored auth"          # Verify quality
/update-docs "document new auth structure"     # Keep docs current
```

## Customization

Each command template can be adapted:

- **Adjust workflow strategies** - Modify analysis approaches and their focus areas
- **Change context loading** - Customize which documentation tiers load
- **Tune external integration** - Adjust when to consult external services
- **Modify output formats** - Tailor results to your preferences

## Command Best Practices

1. **Start with context** - Use `/full-context` before making significant changes
2. **Review before shipping** - Use `/code-review` for important implementations
3. **Keep docs current** - Use `/update-docs` after changes
4. **Preserve progress** - Use `/handoff` to maintain session continuity
5. **Organize code** - Use `/refactor` to maintain clean architecture

These commands form a complete development workflow that emphasizes understanding, quality, and maintainability.