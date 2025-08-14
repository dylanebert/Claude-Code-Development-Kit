# /code-review

*Performs focused code review that surfaces only critical, high-impact findings for solo developers.*

## Core Philosophy

This command prioritizes **needle-moving discoveries** over exhaustive lists. Every finding must demonstrate significant impact on:
- System reliability & stability
- Security vulnerabilities with real exploitation risk
- Performance bottlenecks affecting user experience
- Architectural decisions blocking future scalability
- Critical technical debt threatening maintainability

### 🚨 Critical Findings Only
Issues that could cause production failures, security breaches, or severe user impact within 48 hours.

### 🔥 High-Value Improvements
Changes that unlock new capabilities, remove significant constraints, or improve metrics by >25%.

### ❌ Excluded from Reports
Minor style issues, micro-optimizations (<10%), theoretical best practices, edge cases affecting <1% of users.

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
- "the authentication flow" → Find all files related to auth across the codebase
- "voice pipeline implementation" → Locate voice processing components
- "recent changes" → Parse git history for relevant commits
- "the API routes" → Identify all API endpoint files

#### Read Relevant Documentation
Before analyzing, **read the documentation** to understand:
1. Use `/docs/ai-context/docs-overview.md` to identify relevant docs
2. Read documentation related to the code being reviewed
3. Build a mental model of risks, constraints, and priorities

### Step 2: Define Coverage Areas

Every code review MUST systematically analyze these core areas:

#### 🎯 Mandatory Coverage Areas:

1. **Critical Path Analysis**
   - User-facing functionality that could break
   - Data integrity and state management
   - Error handling and recovery mechanisms

2. **Security Surface**
   - Input validation and sanitization
   - Authentication/authorization flows
   - Data exposure and API security

3. **Performance Impact**
   - Real-time processing bottlenecks
   - Resource consumption (memory, CPU)
   - Scalability constraints

4. **Integration Points**
   - API contracts and boundaries
   - Service dependencies
   - External system interactions

### Step 3: Systematic Review Execution

**Before starting analysis, pause and think deeply:**
- What are the real risks in this code?
- Which areas could cause the most damage if they fail?
- Where would a solo developer need the most help?

Execute systematic analysis across all coverage areas:

```
For each coverage area:
  1. Review auto-loaded project context
  2. Analyze the area with deep focus
  3. For complex issues, consider:
     - mcp__context7__get-library-docs for framework best practices
     - External research for current security practices
  4. Cross-reference with other areas for systemic issues
  5. Document ONLY high-impact findings:

     ## [Coverage_Area] Analysis

     ### 🚨 Critical Issues (Production Risk)
     - Issue: [description]
     - Location: [file:line_number]
     - Impact: [quantified - downtime hours, users affected, data at risk]
     - Fix: [specific code snippet]
     - Consequence if ignored: [what happens in 48 hours]

     ### 🎯 Strategic Improvements (Capability Unlocks)
     - Limitation: [what's currently blocked]
     - Solution: [architectural change or implementation]
     - Unlocks: [new capability or scale]
     - ROI: [effort hours vs benefit quantified]

     ### ⚡ Quick Wins (Optional)
     - Only include if <2 hours for >20% improvement
     - Must show measurable impact
```

### Step 4: Synthesize Findings

After completing systematic analysis:

1. **Filter for Impact**
   - Discard all low-priority findings
   - Quantify real-world impact of each issue
   - Focus on production risks and capability unlocks

2. **Pattern Analysis**
   - Identify systemic issues vs isolated problems
   - Find root causes across the review
   - Detect subtle security vulnerabilities

3. **Strategic Prioritization**
   - Calculate ROI for each improvement
   - Consider solo developer constraints
   - Create actionable fix sequence

### Step 5: Present Comprehensive Review

Structure the final output as:

```markdown
# 🔍 Code Review Report

## Executive Summary
[High-level findings and overall assessment]
- Security Risk Level: [Critical/High/Medium/Low]
- Performance Impact: [description]
- Technical Debt: [assessment]
- Overall Quality Score: [A-F grade with justification]

## 🚨 Production Risks (Fix Within 48 Hours)
[Only issues that could cause downtime, data loss, or security breaches]

## 🎯 Strategic Improvements (High ROI)
[Only changes that unlock capabilities or improve metrics >25%]

## ⚡ Quick Wins (Optional)
[Only if <2 hours effort for significant improvement]

## Detailed Analysis

### Security Assessment
[Detailed security findings]

### Performance Analysis
[Detailed performance findings]

### Architecture Review
[Detailed architecture findings]

### Code Quality Evaluation
[Detailed quality findings]

## Action Plan
1. Critical fixes preventing production failures
2. High-ROI improvements unlocking capabilities

## Impact Matrix
| Issue | User Impact | Effort | ROI |
|-------|-------------|--------|-----|
| [Only high-impact issues with quantified metrics] |
```

### Step 6: Interactive Follow-up

After presenting the review, offer:
- "Would you like me to fix any of the critical issues?"
- "Should I create a detailed refactoring plan for any component?"
- "Do you want me to generate tests for uncovered code?"

## Implementation Notes

1. **Include file:line_number references** for easy navigation
2. **Balance criticism with recognition** of good practices
3. **Provide actionable fixes**, not just problem identification
4. **Consider project phase** and priorities when recommending changes
5. **Keep security findings sensitive** - don't expose vulnerabilities publicly

## Coverage Verification

Before presenting results, verify complete coverage:

```
☑ Critical Path Analysis: [Covered]
☑ Security Surface: [Covered]
☑ Performance Impact: [Covered]
☑ Integration Points: [Covered]
```

If any area lacks coverage, conduct additional focused analysis.