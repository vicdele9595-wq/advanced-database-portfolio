# Performance Analysis

| Query | Before | After | Change |
|---|---|---|---|
| Transcript | 14.5ms | 1.2ms | B-Tree on student_id |
| Top 10 GPA | 45.3ms | 12.1ms | Composite index |

The planner switched from a Sequential Scan to an Index Scan.