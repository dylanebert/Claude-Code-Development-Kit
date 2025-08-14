# /full-context

You are working on the current project. Before proceeding with the user's request "$ARGUMENTS", you need to intelligently gather relevant project context using a structured analysis approach.

## Auto-Loaded Project Context:

@/CLAUDE.md
@/docs/ai-context/project-structure.md
@/docs/ai-context/docs-overview.md

## Step 1: Intelligent Analysis Strategy Decision

Think deeply about the optimal approach based on the project context that has been auto-loaded above. Based on the user's request "$ARGUMENTS" and the project structure/documentation overview, intelligently decide the optimal approach:

### Strategy Options:

**Direct Analysis**:

-   When the request can be handled efficiently with targeted documentation reading and direct analysis
-   Simple questions about existing code or straightforward tasks

**Focused Investigation**:

-   When deep analysis of a specific area would benefit the response
-   For complex single-domain questions or tasks requiring thorough exploration
-   When dependencies and impacts need careful assessment

**Comprehensive Analysis**:

-   When the request involves multiple areas, components, or technical domains
-   When comprehensive understanding requires different analytical perspectives
-   For tasks requiring careful dependency mapping and impact assessment
-   Scale the analysis based on actual complexity, not predetermined patterns

## Step 2: Structured Analysis Design

### For Comprehensive Analysis:

You have complete freedom to design your analysis approach based on:

-   **Project structure discovered** from the auto-loaded `/docs/ai-context/project-structure.md` file tree
-   **Documentation architecture** from the auto-loaded `/docs/ai-context/docs-overview.md`
-   **Specific user request requirements**
-   **Your assessment** of what investigation approach would be most effective

### Analysis Principles:

-   **Structured Investigation**: Define focus areas based on the specific request and project structure
-   **Comprehensive Scope**: Analyze any combination of documentation, code files, and architectural patterns
-   **Complete Coverage**: Ensure all relevant aspects of the user's request are covered systematically
-   **Documentation + Code**: Read relevant documentation files AND examine actual implementation code
-   **Dependency Mapping**: For tasks involving code changes, analyze import/export relationships and identify all files that would be affected
-   **Impact Assessment**: Consider ripple effects across the codebase, including tests, configurations, and related components
-   **Pattern Compliance**: Ensure solutions follow existing project conventions for naming, structure, and architecture
-   **Cleanup Planning**: For structural changes, identify obsolete code, unused imports, and deprecated files that should be removed to prevent code accumulation
-   **External Research**: Consider external searches when current best practices, security advisories, or external compatibility research would enhance the response

### Analysis Structure Template:

```
1. Domain Analysis - [Component/Feature focus]
   - Read relevant CONTEXT.md files
   - Examine core implementation files
   - Map key dependencies and relationships

2. Impact Assessment - [Cross-cutting concerns]
   - Identify affected systems and components
   - Analyze integration points and dependencies
   - Consider testing and deployment implications

3. Implementation Strategy - [Solution approach]
   - Evaluate implementation options
   - Consider architectural alignment
   - Plan incremental delivery approach
```

### For Direct Analysis:

Proceed immediately with targeted analysis of the relevant documentation and code files, using the project structure as your guide to find the most relevant information.

## Step 3: Investigation Execution

### For Comprehensive Analysis:

1. **Execute structured analysis** following your planned approach
2. **Read all relevant documentation** starting with CONTEXT.md files in affected areas
3. **Examine implementation code** in the components you've identified
4. **Map dependencies and relationships** between different parts of the system
5. **Consider external factors** - current frameworks, security best practices, performance implications

### External Context (Optional):

-   **Library Documentation**: For complex integrations, consider consulting Context7 MCP for up-to-date library documentation
-   **Best Practices**: Research current patterns and security considerations when relevant

## Step 4: Synthesis and Response

Combine your findings into a comprehensive understanding:

1. **Summarize key insights** from your analysis
2. **Identify relationships and dependencies** between different components
3. **Propose solutions or approaches** that align with the project's architecture
4. **Consider implementation impact** across the entire system
5. **Provide actionable recommendations** based on the complete context

### Example Response Pattern:

"Analysis revealed [key findings about the current architecture]. I'll [proposed approach] by [specific implementation strategy], following the established pattern used in [reference to existing patterns]. This will require [specific changes] and [dependency updates]."

**User provided context**: "$ARGUMENTS"

Begin your analysis now.
