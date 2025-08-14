# /create-docs

_Generates initial documentation structure for projects adopting the 3-tier documentation system._

## Auto-Loaded Project Context:

@/CLAUDE.md
@/docs/ai-context/project-structure.md
@/docs/ai-context/docs-overview.md

## Step 1: Parse Documentation Request

User provided context: "$ARGUMENTS"

Analyze the request to determine:

1. **Target Path**: Specific file/directory or entire project
2. **Documentation Tier**: Which tier (1, 2, or 3) needs creation
3. **Scope**: Single file, component, or comprehensive project documentation

## Step 2: Project Analysis Strategy

Based on the request scope, determine analysis approach:

### For Specific Path:

-   Focus on the specified component/feature
-   Analyze its role, dependencies, and patterns
-   Create appropriate tier documentation

### For Comprehensive Documentation:

-   Systematically analyze entire project structure
-   Identify component boundaries and features
-   Create complete documentation hierarchy

## Step 3: Documentation Generation

### Tier 1 - Foundation (CLAUDE.md)

If creating master context:

```markdown
# [Project Name] - AI Context

## 1. Project Overview

-   Vision and goals
-   Current phase
-   Key architecture
-   Development strategy

## 2. Project Structure

[Reference to project-structure.md]

## 3. Coding Standards & AI Instructions

-   General instructions
-   File organization
-   Naming conventions
-   Documentation requirements
-   Security practices
-   Error handling
-   API design principles
```

### Tier 2 - Component (CONTEXT.md)

For component-level documentation:

```markdown
# [Component Name] Context

## Overview

Purpose and responsibility of this component

## Architecture

-   Design patterns used
-   Key abstractions
-   Integration points

## Core Concepts

-   Domain models
-   Business logic
-   Data flow

## Dependencies

-   External libraries
-   Internal components
-   Services

## Conventions

-   Component-specific patterns
-   Naming standards
-   File organization
```

### Tier 3 - Feature (CONTEXT.md)

For feature-specific documentation:

```markdown
# [Feature Name] Implementation

## Purpose

Specific functionality provided

## Technical Specifications

-   Input/output contracts
-   Data structures
-   API endpoints
-   Event handlers

## Implementation Details

-   Algorithms used
-   Performance considerations
-   Error handling
-   Edge cases

## Testing Strategy

-   Unit test patterns
-   Integration points
-   Test data requirements
```

## Step 4: Systematic Execution

### For Comprehensive Documentation Creation:

1. **Analyze Project Structure**

    - Read directory structure
    - Identify major components
    - Map feature boundaries

2. **Create Tier 1 Documentation**

    - Generate/update CLAUDE.md
    - Create project-structure.md
    - Create docs-overview.md

3. **Create Tier 2 Documentation**

    - For each major component directory
    - Generate component CONTEXT.md
    - Document architectural decisions

4. **Create Tier 3 Documentation**
    - For each feature subdirectory
    - Generate feature CONTEXT.md
    - Document implementation specifics

## Step 5: Quality Validation

Before finalizing:

1. **Completeness Check**

    - All components have documentation
    - All tiers properly represented
    - Cross-references are correct

2. **Accuracy Verification**

    - Documentation matches code reality
    - Examples are current
    - No placeholder content

3. **Consistency Review**
    - Naming conventions followed
    - Format is uniform
    - Tier boundaries respected

## Step 6: Present Results

```markdown
# Documentation Generation Complete

## Created Files

-   [file path]: [tier and purpose]
-   [file path]: [tier and purpose]

## Documentation Structure

-   Tier 1: [files created]
-   Tier 2: [components documented]
-   Tier 3: [features documented]

## Next Steps

1. Review generated documentation for accuracy
2. Add project-specific details where marked
3. Update regularly as code evolves
```

## Implementation Notes

1. **Read existing code** before generating documentation
2. **Infer patterns** from current implementation
3. **Use consistent formatting** across all files
4. **Include concrete examples** from actual code
5. **Avoid generic placeholders** - use real project details

## Error Handling

If unable to determine structure:

-   Ask for clarification on component boundaries
-   Suggest a proposed structure for confirmation
-   Offer to analyze a subset first

Begin documentation generation now.
