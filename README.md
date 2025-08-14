# Claude Code Development Kit

[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

An integrated system that provides automated context management for Claude Code through structured documentation and command templates.

> **Related**: Check out [Freigeist](https://www.freigeist.dev) - upcoming AI coding platform for complex projects!

## Why Claude Code?

Claude Code's powerful context management capabilities make it ideal for this automated, integrated approach. The documentation structure and command templates work seamlessly with Claude Code's workflow management.

## 🎯 Why This Kit?

> *Ever tried to build a large project with AI assistance, only to watch it struggle as your codebase grows?*

Claude Code's output quality directly depends on what it knows about your project. As AI-assisted development scales, three critical challenges emerge:

---

### Challenge 1: Context Management

**The Problem:**
```
❌ Loses track of your architecture patterns and design decisions
❌ Forgets your coding standards and team conventions
❌ No guidance on where to find the right context in large codebases
```

**The Solution:**
✅ **Automated context delivery** through integrated systems:
- **3-tier documentation system** - Auto-loads the right docs at the right time
- **Custom commands** - Provides structured workflows that leverage your project context
- Result: No manual context loading, consistent knowledge across all sessions

---

### Challenge 2: AI Reliability 

**The Problem:**
```
❌ Outdated library documentation
❌ Hallucinated API methods
❌ Inconsistent architectural decisions
```

**The Solution:**
✅ **Current documentation** through MCP integration:

| Service | Purpose | Benefit |
|---------|---------|---------|
| **Context7** | Real-time library docs | Current APIs, not training data |

*Result: Fewer errors, better code, current standards*

---

### Challenge 3: Automation Without Complexity

**The Problem:**
```
❌ Manual context loading for every session
❌ Repetitive command sequences
❌ No feedback when tasks complete
```

**The Solution:**
✅ **Intelligent automation** through command templates:
- Automatic updates of documentation through custom commands
- Structured workflows for complex tasks
- Context-aware command execution

---

### 🎉 The Result

> **Claude Code transforms from a helpful tool into a reliable development partner that remembers your project context and provides structured workflows for complex tasks.**


[![Demo-Video auf YouTube](https://img.youtube.com/vi/kChalBbMs4g/0.jpg)](https://youtu.be/kChalBbMs4g)




## Quick Start

### Prerequisites

- **Required**: [Claude Code](https://github.com/anthropics/claude-code)
- **Recommended**: MCP servers like [Context7](https://github.com/upstash/context7)

#### Platform Support

- **Windows**: ❌ (has reported bugs - use at your own risk)

### Installation

#### Option 1: Quick Install (Recommended)

Run this single command in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/peterkrueck/Claude-Code-Development-Kit/main/install.sh | bash
```

This will:
1. Download the framework
2. Guide you through an interactive setup
3. Install everything in your chosen project directory
4. Provide links to optional MCP server installations


https://github.com/user-attachments/assets/0b4a1e69-bddb-4b58-8de9-35f97919bf44


#### Option 2: Clone and Install

```bash
git clone https://github.com/peterkrueck/Claude-Code-Development-Kit.git
cd Claude-Code-Development-Kit
./setup.sh
```

### What Gets Installed

The setup script will create the following structure in your project:

```
your-project/
├── .claude/
│   ├── commands/          # Command templates (.md files)
│   └── settings.local.json # Generated Claude Code configuration (if Context7 selected)
├── docs/                  # Documentation templates and examples
│   ├── ai-context/        # Core documentation files
│   ├── open-issues/       # Issue tracking examples
│   ├── specs/             # Specification templates
│   ├── CONTEXT-tier2-component.md  # Component documentation template
│   └── CONTEXT-tier3-feature.md    # Feature documentation template
├── CLAUDE.md              # Your project's AI context (from template)
```

**Note**: The exact files installed depend on your choices during setup (MCP servers, etc.)

### Post-Installation Setup

1. **Customize your AI context**:
   - Edit `CLAUDE.md` with your project standards
   - Update `docs/ai-context/project-structure.md` with your tech stack

2. **Install MCP servers** (if Context7 selected during setup):
   - Follow the links provided by the installer
   - Configure in your Claude Code settings

3. **Test your installation**:
   ```bash
   claude
   /full-context "analyze my project structure"
   ```


## Terminology

- **CLAUDE.md** - Master context files containing project-specific AI instructions, coding standards, and integration patterns
- **CONTEXT.md** - Component and feature-level documentation files (Tier 2 and Tier 3) that provide specific implementation details and patterns
- **MCP (Model Context Protocol)** - Standard for integrating external AI services with Claude Code
- **3-Tier Documentation** - Hierarchical organization (Foundation/Component/Feature) that minimizes maintenance while maximizing AI effectiveness
- **Auto-loading** - Automatic inclusion of relevant documentation when commands execute

## Architecture

### Context Management Architecture

```
                        CLAUDE CODE
                   ┌─────────────────┐
                   │                 │
                   │    COMMANDS      │
                   │                 │
                   └────────┬────────┘
                  Structured│workflows
                   Context │loading
                           ╱│╲
                          ╱ │ ╲
        Auto-loads      ╱  │  ╲  Leverages
        project docs  ╱   │   ╲ current docs
                     ╱    │    ╲
                    ▼     │     ▼
         ┌─────────────────┐│┌─────────────────┐
         │                 │││                 │
         │  DOCUMENTATION  │││  MCP SERVERS   │
         │                 │││                 │
         └─────────────────┘│└─────────────────┘
          3-tier structure  │  Context7
          Auto-loading      │  Real-time docs
          Context routing   │  Current APIs
                      ╲     │     ╱
                       ╲    │    ╱
        Provides project╲   │   ╱ Enhances with
        context and      ╲  │  ╱  up-to-date
        standards        ╲ │ ╱   information
                           ╲│╱
                            ▼
                    Integrated Workflow
```

### Auto-Loading Mechanism

Every command execution automatically loads critical documentation:

```
@/CLAUDE.md                              # Master AI context and coding standards
@/docs/ai-context/project-structure.md   # Complete technology stack and file tree
@/docs/ai-context/docs-overview.md       # Documentation routing map
```

This ensures:
- Consistent AI behavior across all sessions
- Zero manual context management

### Component Integration

**Commands ↔️ Documentation**
- Commands determine which documentation tiers to load based on task complexity
- Documentation structure guides agent spawning patterns
- Commands update documentation to maintain current context

**Commands ↔️ MCP Servers**
- Context7 provides up-to-date library documentation
- Integration happens seamlessly within command workflows

**Documentation ↔️ MCP Servers**
- Project structure automatically provides context to external services
- Ensures external services understand specific architecture and coding standards
- Makes all recommendations project-relevant and standards-compliant


## Common Tasks

### Starting New Feature Development

```bash
/full-context "implement user authentication across backend and frontend"
```

The system:
1. Auto-loads project documentation
2. Provides structured analysis workflow
3. Consults Context7 for authentication framework documentation (if configured)
4. Provides comprehensive analysis and implementation plan

### Code Review with Multiple Perspectives

```bash
/code-review "review authentication implementation"
```

Structured analysis covers:
- Security vulnerabilities
- Performance implications
- Architectural alignment
- Integration impacts

### Maintaining Documentation Currency

```bash
/update-docs "document authentication changes"
```

Automatically:
- Updates affected CLAUDE.md files across all tiers
- Keeps project-structure.md and docs-overview.md up-to-date
- Maintains context for future AI sessions
- Ensures documentation matches implementation

## Creating Your Project Structure

After installation, you'll add your own project-specific documentation:

```
your-project/
├── .claude/
│   ├── commands/              # Command templates
│   └── settings.json          # Claude Code configuration (if Context7 configured)
├── docs/
│   ├── ai-context/            # Foundation documentation (Tier 1)
│   │   ├── docs-overview.md   # Documentation routing map
│   │   ├── project-structure.md # Technology stack and file tree
│   │   ├── system-integration.md # Cross-component patterns
│   │   ├── deployment-infrastructure.md # Infrastructure context
│   │   └── handoff.md        # Session continuity
│   ├── open-issues/           # Issue tracking templates
│   ├── specs/                 # Feature specifications
│   └── README.md              # Documentation system guide
├── CLAUDE.md                  # Master AI context (Tier 1)
├── backend/
│   ├── **`CONTEXT.md`**       # Backend context (Tier 2) - 🔴 create this
│   └── src/api/
│       └── **`CONTEXT.md`**   # API context (Tier 3) - 🔴 create this
└── frontend/
    ├── **`CONTEXT.md`**       # Frontend context (Tier 2) - 🔴 create this
    └── src/components/
        └── **`CONTEXT.md`**   # Components context (Tier 3) - 🔴 create this
```

The framework provides templates for CONTEXT.md files in `docs/`:
- `docs/CONTEXT-tier2-component.md` - Use as template for component-level docs
- `docs/CONTEXT-tier3-feature.md` - Use as template for feature-level docs

## Configuration

The kit is designed for adaptation:

- **Commands** - Modify workflow patterns in `.claude/commands/`
- **Documentation** - Adjust tier structure for your architecture
- **MCP Integration** - Add additional servers for specialized functionality

## Best Practices

1. **Let documentation guide development** - The 3-tier structure reflects natural boundaries
2. **Update documentation immediately** - Use `/update-docs` after significant changes
3. **Trust the auto-loading** - Avoid manual context management
4. **Use structured workflows** - Leverage commands for consistent task execution


## Documentation

- [Documentation System Guide](docs/) - Understanding the 3-tier architecture
- [Commands Reference](commands/) - Detailed command usage
- [MCP Integration](docs/CLAUDE.md) - Configuring external services

## Contributing

The kit represents one approach to AI-assisted development. Contributions and adaptations are welcome.

## FAQ

**Q: Will the setup overwrite my existing files?**

**A:** No, the installer detects existing files and prompts you to skip or overwrite each one. For safety, I highly recommend installing on a new Git branch. Safe is safe.

**Q: Can I use this with other AI coding tools like Cursor or Cline?**

**A:** Yes, the documentation structure works with any tool (rename CLAUDE.md to match your tool's convention). The command templates are optimized for Claude Code's workflow capabilities but can be adapted for other tools.

**Q: How much will this cost in tokens?**

**A:** This framework uses tokens due to comprehensive context loading. The structured documentation system helps optimize token usage by providing relevant context efficiently.


**Q: Can I use this framework with an existing project?**

**A:** Yes! The framework works well with existing projects. When installing, check if you already have a project structure or CLAUDE.md file and adjust accordingly during the setup prompts. To get started with an existing codebase, use Claude Code to analyze your project and create the initial project-structure.md:

```
"Read and understand the project_structure.md template in docs/ai-context/project_structure.md. Your task is to fill out this template with our project's details by analyzing the codebase structure and creating the markdown file."
```

After creating the project structure, use the framework's documentation generation system to create component-level and feature-level context files:

```
/create-docs "[your-main-component-path]/CONTEXT.md"
```

This approach lets the framework learn your existing architecture and systematically create appropriate documentation that matches your current project structure.

## Connect

Feel free to connect with me on [LinkedIn](https://www.linkedin.com/in/peterkrueck/) if you have questions, need clarification, or wish to provide feedback.
