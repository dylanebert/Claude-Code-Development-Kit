# /update-docs

_Updates existing documentation to reflect recent code changes, maintaining the critical context that powers AI-assisted development._

## Core Documentation Principle

Documentation must reflect the current "is" state as if it has always existed this way:

### ✅ Write Like This:

-   "The system uses WebSocket connections for real-time updates"
-   "Authentication is handled through JWT tokens with 24-hour expiry"
-   "The API validates all inputs using Zod schemas"

### ❌ Never Write Like This:

-   "The system now uses WebSocket connections (previously used polling)"
-   "We changed authentication from sessions to JWT tokens"
-   "The API was updated to validate inputs using Zod"

**Why**: Documentation is read by future sessions that have no context of past states. Historical comparisons create confusion and accumulate as technical debt.

## Auto-Loaded Project Context:

@/CLAUDE.md
@/docs/ai-context/project-structure.md
@/docs/ai-context/docs-overview.md

## Step 1: Intelligent Update Strategy

Think deeply about the optimal approach based on changes detected or specified by the user:

### Strategy Options:

**Direct Update**:

-   Documentation path explicitly provided
-   Clear, isolated changes to document
-   Simple updates to existing patterns

**Focused Analysis**:

-   Specific component or feature modified
-   Changes affecting particular documentation tier
-   Updates needed in 2-3 documentation files

**Comprehensive Analysis**:

-   Major architectural changes
-   Cross-cutting updates affecting multiple tiers
-   Systematic documentation regeneration needed

## Step 2: Change Detection & Analysis

### Investigation Areas:

Based on the user's context "$ARGUMENTS", systematically analyze:

1. **Code Changes**

    - What files were modified, added, or removed?
    - What functionality changed?
    - What patterns or conventions evolved?

2. **Architectural Impact**

    - Did component boundaries shift?
    - Were new integration points created?
    - Did system flow or data patterns change?

3. **Documentation Gaps**

    - What existing documentation is now incorrect?
    - What new documentation is needed?
    - Which tier (1, 2, or 3) needs updates?

4. **Cross-References**
    - Which other documentation files reference changed components?
    - What examples or patterns need updating?
    - Are there cascading documentation updates needed?

## Step 3: Documentation Update Execution

### For Direct Updates:

Proceed immediately to update the specified documentation file with accurate current state.

### For Comprehensive Updates:

Systematically update documentation across all affected tiers:

```
For each affected documentation file:
  1. Read current documentation
  2. Identify sections needing updates
  3. Rewrite to reflect current implementation
  4. Ensure consistency with related docs
  5. Remove any outdated information
```

### Update Patterns by Tier:

**Tier 1 (CLAUDE.md)** - Update when:

-   Coding standards changed
-   Security requirements evolved
-   New architectural patterns adopted
-   Development workflow modified

**Tier 2 (Component CONTEXT.md)** - Update when:

-   Component responsibilities changed
-   Integration patterns modified
-   New architectural decisions made
-   Component boundaries shifted

**Tier 3 (Feature CONTEXT.md)** - Update when:

-   Implementation details changed
-   API contracts modified
-   Data structures evolved
-   Technical specifications updated

## Step 4: Documentation Quality Checks

Before finalizing updates, verify:

1. **Accuracy**: Does documentation match current code exactly?
2. **Completeness**: Are all changes reflected?
3. **Consistency**: Do all tiers align with each other?
4. **Clarity**: Is the documentation clear and unambiguous?
5. **No History**: Have all historical references been removed?

## Step 5: Present Updates

Summarize the documentation updates made:

```markdown
# Documentation Updates Complete

## Files Updated

-   [file path]: [brief description of changes]
-   [file path]: [brief description of changes]

## Key Changes Documented

-   [Major change category]
    -   [Specific update made]
    -   [Related documentation aligned]

## Documentation Health

-   Accuracy: ✅ Matches current implementation
-   Coverage: ✅ All changes documented
-   Consistency: ✅ All tiers aligned
```

## Implementation Notes

1. **Always write in present tense** describing current state
2. **Remove outdated information** completely, don't mark as deprecated
3. **Update examples** to use current patterns
4. **Maintain tier boundaries** - don't mix concerns
5. **Check cross-references** in other documentation files

## Error Handling

If the user's request is ambiguous:

-   List detected changes and ask which need documentation
-   Suggest documentation files that might need updates
-   Offer to scan for undocumented changes

User provided context: "$ARGUMENTS"

Begin the documentation update process now.
