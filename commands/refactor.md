# /refactor

_Intelligently restructures code while maintaining functionality and updating all dependencies._

## Auto-Loaded Project Context:

@/CLAUDE.md
@/docs/ai-context/project-structure.md
@/docs/ai-context/docs-overview.md

## Step 1: Parse Refactoring Request

User provided context: "$ARGUMENTS"

Parse the request to identify:

1. **Target Files**: Extract @-tagged files from arguments
2. **Refactoring Goal**: Understand the desired outcome
3. **Scope**: Determine affected components and dependencies

## Step 2: Pre-Refactoring Analysis

### Systematic Investigation:

1. **Current Structure Analysis**

    - Read all tagged files completely
    - Map current organization and patterns
    - Identify code smells and improvement opportunities

2. **Dependency Mapping**

    - Find all files importing the target modules
    - Identify exported items (functions, classes, types)
    - Map circular dependencies if any

3. **Impact Assessment**
    - List all files that will need updates
    - Identify test files requiring changes
    - Assess configuration impacts

## Step 3: Refactoring Strategy

Based on analysis, determine the refactoring approach:

### Common Refactoring Patterns:

**File Splitting** - Breaking large files into smaller, focused modules:

-   Identify logical boundaries
-   Group related functionality
-   Extract shared utilities
-   Separate types/interfaces

**Component Extraction** - Moving functionality to new components:

-   Isolate reusable logic
-   Create clear interfaces
-   Maintain single responsibility

**Structure Reorganization** - Improving project organization:

-   Move files to appropriate directories
-   Establish clear module boundaries
-   Improve naming consistency

**Code Modernization** - Updating to current patterns:

-   Apply modern language features
-   Improve type safety
-   Optimize performance

## Step 4: Refactoring Execution

### Systematic Approach:

1. **Create New Structure**

    ```
    For each new file to create:
    - Extract relevant code sections
    - Update imports within the file
    - Add appropriate exports
    - Include documentation headers
    ```

2. **Update Original Files**

    ```
    For each refactored file:
    - Remove extracted code
    - Add imports for extracted modules
    - Update internal references
    - Clean up unused imports
    ```

3. **Update Dependencies**

    ```
    For each dependent file:
    - Update import statements
    - Adjust import paths
    - Fix any broken references
    - Verify functionality preserved
    ```

4. **Update Tests**
    ```
    For each test file:
    - Update import paths
    - Adjust mocked modules
    - Verify tests still pass conceptually
    ```

## Step 5: Quality Validation

### Post-Refactoring Checks:

1. **Completeness**

    - All code successfully moved/reorganized
    - No functionality lost
    - All dependencies updated

2. **Consistency**

    - Naming conventions followed
    - File organization matches project standards
    - Documentation updated

3. **Import Health**

    - No circular dependencies introduced
    - Import paths optimized
    - Unused imports removed

4. **Code Quality**
    - Improved readability
    - Better separation of concerns
    - Enhanced maintainability

## Step 6: Present Refactoring Results

```markdown
# Refactoring Complete

## Files Created

-   [new file path]: [purpose and contents]
-   [new file path]: [purpose and contents]

## Files Modified

-   [file path]: [changes made]
-   [file path]: [changes made]

## Dependencies Updated

-   [count] import statements updated
-   [count] test files adjusted
-   [count] configuration files modified

## Improvements Achieved

-   ✅ [Specific improvement]
-   ✅ [Specific improvement]
-   ✅ [Specific improvement]

## Migration Guide

1. [Any manual steps required]
2. [Build/test commands to run]
3. [Documentation to update]
```

## Implementation Notes

1. **Preserve all functionality** - Refactoring should not change behavior
2. **Update all references** - No broken imports or dependencies
3. **Follow project conventions** - Match existing patterns and structure
4. **Clean as you go** - Remove dead code and unused imports
5. **Document the changes** - Update relevant documentation

## Common Refactoring Scenarios

### Large File Breakdown

```
original-file.ts (1000+ lines) →
├── core-logic.ts
├── utilities.ts
├── types.ts
├── constants.ts
└── index.ts (re-exports)
```

### Feature Extraction

```
monolithic-component/ →
├── features/
│   ├── feature-a/
│   ├── feature-b/
│   └── shared/
└── index.ts
```

### Layer Separation

```
mixed-concerns.ts →
├── presentation/
├── business-logic/
├── data-access/
└── types/
```

## Error Handling

If refactoring is risky or unclear:

-   Present analysis and ask for confirmation
-   Suggest alternative approaches
-   Offer to refactor incrementally
-   Warn about potential breaking changes

Begin refactoring analysis now.
