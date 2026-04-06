Status: Draft
Owner: <name>
Workflow Version: <x.y.z>
Last Updated: YYYY-MM-DD
Related: <other docs>
Traceability: <upstream -> <AREA>_REFACTOR.md -> *_PLAN.md, ARCHITECTURE.md>

# <AREA> Refactor Plan

## Context
**Trigger:** <why this refactor is being considered>
**Scope:** <what is in/out of scope — files, modules, layers>

## Findings

<!--
Organize findings by concern area. Use numbered subsection headings
(1.1, 1.2, ...) so plan documents can reference findings by ID.

For each finding that involves code changes:
1. Show the CURRENT code (before).
2. List refactor OPTIONS (A, B, C, ...) — at least two when the fix isn't
   obvious. Each option gets:
   - A short label and one-sentence description.
   - A concrete code sample (≤15 lines) showing what the result looks like.
   - Tradeoffs: what you gain, what you lose or risk.
3. End with a RECOMMENDATION stating which option to prefer and why, or
   leave it as "Decision needed" if the choice isn't clear-cut.
4. Add a DECISION block — a checklist of all options so the reviewer can
   accept or override the recommendation in place:

   **DECISION:**
   - [x] A — <label>  ← RECOMMENDED
   - [ ] B — <label>
   - [ ] C — <label>

   If the reviewer's rationale differs from the recommendation, add a
   > quote line below the checklist.

Use whichever concern headings fit the codebase. The sections below are
starting suggestions — add, remove, or rename as needed.
-->

### 1. Code Duplication

<!-- For each duplicated block: show where it appears, quote the repeated
     code, and show the proposed extraction or shared helper. -->

### 2. Naming Issues
| Location | Current | Suggested | Rationale |

### 3. Inconsistent Patterns
| Pattern | Where Used | Inconsistency | Suggested Standard |

### 4. Magic Numbers / Hard-Coded Values
| Location | Value | Suggested Constant | Notes |

### 5. Complexity Hotspots
| Function or Module | Lines | Issue | Suggested Action |

### 6. Dead Code
| Code | Location | Reason | Action |

### 7. File Organisation / Readability

<!-- Structure, section ordering, missing separators, commented-out code,
     formatting inconsistencies, documentation gaps. -->

## Risk Areas
## Incremental Strategy
## Checklist

<!-- Track decision lifecycle here. Implementation tasks go in *_PLAN.md.
     Example items:
     - [ ] All findings cataloged
     - [ ] Options evaluated for each finding
     - [ ] Recommendations made for all findings
     - [ ] Inline decisions reviewed and accepted
     - [ ] Priority ordering confirmed
     - [ ] *_PLAN.md created from accepted recommendations
-->
