# Partition Performance
on the [partitioning.sql](partitioning.sql), you can see that large table like booking partitioned using start_date.
# Why Partition by YEAR(start_date)?
Large tables like Bookings usually have queries filtering by date ranges. Partitioning ensures MySQL only scans relevant partitions, not the entire table.
# the improvements observed
### Before Partitioning:
Queries like
`SELECT * FROM Bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31'; `
scanned the entire table (full table scan).
### After Partitioning:
Using `PARTITION BY RANGE (YEAR(start_date))`, MySQL only scans the partitions for 2025.
This reduces the number of rows scanned and improves performance significantly on large datasets.
### Observed Improvements:
* Faster execution time for date-based queries.
* Lower number of scanned rows in EXPLAIN.
