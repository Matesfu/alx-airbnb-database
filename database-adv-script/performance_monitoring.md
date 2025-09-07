# Database Performance Monitoring and Optimization Report

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

---

## Step 1: Monitoring Queries
used `EXPLAIN` and `SHOW PROFILE` to monitor the performance of frequently used queries.

### Example Query:
`EXPLAIN SELECT 
    u.user_id, u.first_name, u.last_name, u.email,
    p.property_id, p.name AS property_name, p.location,
    b.booking_id, b.start_date, b.end_date, b.status,
    pay.payment_id, pay.amount, pay.payment_date
FROM Bookings b
JOIN Users u ON u.user_id = b.user_id
JOIN Properties p ON p.property_id = b.property_id
JOIN Payments pay ON pay.booking_id = b.booking_id
WHERE b.start_date >= '2025-09-01' 
  AND b.end_date <= '2025-09-30';`

### Observations from EXPLAIN

The query performed full table scans on Bookings and Payments.  
Joins relied on scanning large datasets without efficient filtering.  
No composite index existed on (start_date, end_date).  
## Step 2: Identifying Bottlenecks
Bookings Table: Filtering by date range without index → slow range queries.  
Payments Table: Lookup by booking_id required full scans.  
Users & Properties Tables: Lookup by primary keys was efficient.  
## Step 3: Schema Adjustments
### 1. Add Composite Index on Bookings
`CREATE INDEX idx_bookings_date_range 
ON Bookings (start_date, end_date);`

### 2. Add Index on Payments
`CREATE INDEX idx_payments_booking 
ON Payments (booking_id);`

### Step 4: Performance After Indexing
Query Analysis After Optimization  
`EXPLAIN ANALYZE SELECT 
    u.user_id, u.first_name, u.last_name, u.email,
    p.property_id, p.name AS property_name, p.location,
    b.booking_id, b.start_date, b.end_date, b.status,
    pay.payment_id, pay.amount, pay.payment_date
FROM Bookings b
JOIN Users u ON u.user_id = b.user_id
JOIN Properties p ON p.property_id = b.property_id
JOIN Payments pay ON pay.booking_id = b.booking_id
WHERE b.start_date >= '2025-09-01' 
  AND b.end_date <= '2025-09-30';`

## Improvements

Query execution switched from full table scan to range scan on Bookings.  
Join with Payments now uses idx_payments_booking for quick lookups.  
Execution time reduced significantly.  
