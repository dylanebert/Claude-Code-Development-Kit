# /code-review

_Performs focused code review that identifies consolidation opportunities and promotes lean, maintainable code._

## Core Philosophy

This command prioritizes **code leanness and simplification** over exhaustive analysis. Every finding must demonstrate significant impact on:

-   Code consolidation and deduplication opportunities
-   Complexity reduction and simplification potential
-   Dead code elimination and unused export removal
-   Over-engineering and unnecessary abstraction detection
-   Architectural simplification and dependency reduction

### 🧹 Consolidation Focus

Duplicate patterns, repetitive logic, and extractable utilities that could reduce codebase size by >20%.

### 📉 Simplification Priority

Over-engineered solutions, unnecessary abstractions, and verbose implementations that violate KISS principles.

### ❌ Excluded from Reports

Minor style issues, micro-optimizations (<10%), theoretical best practices, perfect abstraction patterns.

## Auto-Loaded Project Context:

@/CLAUDE.md
@/docs/ai-context/project-structure.md
@/docs/ai-context/docs-overview.md

## Command Execution

User provided context: "$ARGUMENTS"

### Step 1: Understand Intent & Gather Context

#### Parse the Request

Analyze the natural language input to determine:

1. **What to review**: Parse file paths, component names, feature descriptions, or commit references
2. **Review focus**: Identify any specific concerns mentioned (security, performance, etc.)
3. **Scope inference**: Intelligently determine the breadth of review needed

Examples of intent parsing:

-   "the authentication flow" → Find all files related to auth across the codebase
-   "voice pipeline implementation" → Locate voice processing components
-   "recent changes" → Parse git history for relevant commits
-   "the API routes" → Identify all API endpoint files

#### Read Relevant Documentation

Before analyzing, **read the documentation** to understand:

1. Use `/docs/ai-context/docs-overview.md` to identify relevant docs
2. Read documentation related to the code being reviewed
3. Build a mental model of risks, constraints, and priorities

### Step 2: Define Coverage Areas

Every code review MUST systematically analyze these core areas:

#### 🎯 Mandatory Coverage Areas:

1. **Code Consolidation Analysis**

    - Duplicate code blocks and repeated patterns
    - Similar functions that could be merged
    - Extractable shared utilities and constants
    - Repetitive error handling or validation logic

2. **Complexity Assessment**

    - Over-engineered implementations of simple problems
    - Unnecessary abstraction layers and indirection
    - Verbose code that could be simplified
    - Cyclomatic complexity exceeding reasonable thresholds

3. **Dead Code Detection**

    - Unused exports and orphaned files
    - Unreachable code paths and dead branches
    - Commented-out code accumulation
    - Obsolete features and deprecated patterns

4. **Architecture Simplification**
    - Mixed concerns and god objects
    - Circular dependencies and coupling issues
    - Overly complex inheritance hierarchies
    - Unnecessary service layers or facades

### Step 3: Systematic Review Execution

**Before starting analysis, pause and think deeply:**

-   Where is the code unnecessarily complex or verbose?
-   What patterns are repeated that could be consolidated?
-   Which abstractions add no value and only increase complexity?
-   What code could be eliminated without impact?

Execute systematic analysis across all coverage areas:

```
For each coverage area:
  1. Review auto-loaded project context and KISS/YAGNI/DRY principles
  2. Analyze the area for consolidation and simplification opportunities
  3. For patterns and best practices, consider:
     - mcp__context7__get-library-docs for simpler framework patterns
     - Research on reducing complexity and technical debt
  4. Cross-reference to find systemic duplication patterns
  5. Document ONLY high-impact consolidation opportunities:

     ## [Coverage_Area] Analysis

     ### 🧹 Consolidation Opportunities
     - Pattern: [duplicated pattern description]
     - Locations: [file:line_number references]
     - Lines saved: [estimated reduction]
     - Solution: [specific consolidation approach]
     - ROI: [maintenance hours saved/month]

     ### 📉 Complexity Reduction
     - Current: [complex implementation]
     - Simplified: [proposed simpler solution]
     - Complexity score: [before] → [after]
     - Readability improvement: [quantified]

     ### 🗑️ Elimination Candidates
     - Dead code: [what can be removed]
     - Impact: [none/minimal]
     - Lines removed: [count]
     - Dependencies cleaned: [count]
```

### Step 4: Synthesize Findings

After completing systematic analysis:

1. **Filter for Impact**

    - Focus on consolidations saving >30 lines
    - Prioritize complexity reductions >25%
    - Highlight dead code eliminating entire files
    - Quantify maintenance time savings

2. **Pattern Analysis**

    - Identify systemic duplication patterns
    - Find common over-engineering anti-patterns
    - Detect accumulation of technical debt
    - Map dependency tangles and circular references

3. **Strategic Prioritization**
    - Calculate lines of code reduction potential
    - Estimate complexity score improvements
    - Consider effort vs. simplification gained
    - Create consolidation roadmap

### Step 5: Present Comprehensive Review

Structure the final output as:

```markdown
# 🔍 Code Review Report: Lean Code Analysis

## Executive Summary

[High-level findings focused on consolidation potential]

-   Code Reduction Potential: [X lines / Y%]
-   Complexity Score: [Current → Proposed]
-   Files Eliminatable: [count]
-   Maintenance Savings: [hours/month]

## 🧹 Major Consolidation Opportunities

[Duplicate patterns that can be extracted into shared utilities]

## 📉 Complexity Reduction Targets

[Over-engineered code that can be simplified significantly]

## 🗑️ Dead Code Elimination

[Unused code, files, and exports that can be removed]

## ⚡ Quick Wins (<2 hours, >20% improvement)

[Simple changes with high impact on code leanness]

## Detailed Analysis

### Code Duplication Assessment

[Specific duplicate patterns with file:line references]

### Complexity Analysis

[Verbose or over-engineered implementations]

### Architecture Simplification

[Unnecessary abstractions and coupling issues]

### Dependency Optimization

[Circular dependencies and unnecessary imports]

## Consolidation Roadmap

1. Extract shared utilities from duplicate patterns
2. Simplify over-engineered components
3. Remove dead code and unused exports
4. Flatten unnecessary hierarchies

## Impact Matrix

| Finding                                    | Lines Saved | Complexity Reduction | Effort | Priority |
| ------------------------------------------ | ----------- | -------------------- | ------ | -------- |
| [Consolidation opportunities with metrics] |
```

### Step 6: Interactive Follow-up

After presenting the review, offer:

-   "Would you like me to consolidate any of the duplicate patterns?"
-   "Should I simplify the over-engineered components?"
-   "Do you want me to remove the identified dead code?"
-   "Should I create a refactoring plan for the complex areas?"

## Implementation Notes

1. **Include file:line_number references** for easy navigation
2. **Quantify consolidation opportunities** in concrete terms (lines saved, files removed)
3. **Provide specific refactoring patterns**, not just identification
4. **Follow KISS, YAGNI, DRY principles** from the project's CLAUDE.md
5. **Focus on maintainability** over theoretical perfection

## Coverage Verification

Before presenting results, verify complete coverage:

```
☑ Code Consolidation Analysis: [Covered]
☑ Complexity Assessment: [Covered]
☑ Dead Code Detection: [Covered]
☑ Architecture Simplification: [Covered]
```

If any area lacks coverage, conduct additional focused analysis.
