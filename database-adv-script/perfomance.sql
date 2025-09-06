SELECT u.user_id, u.first_name, u.last_name, u.email,
	p.property_id, p.name, p.location,
    b.booking_id, b.start_date, b.end_date, b.status,
    pay.payment_id, pay.amount, pay.payment_date
FROM Bookings b
JOIN Users u ON u.user_id = b.user_id
JOIN Properties p ON p.property_id = b.property_id
LEFT JOIN Payments pay ON pay.booking_id = b.booking_id

-- let's analyze the query’s performance using EXPLAIN
EXPLAIN SELECT u.user_id, u.first_name, u.last_name, u.email,
	p.property_id, p.name, p.location,
    b.booking_id, b.start_date, b.end_date, b.status,
    pay.payment_id, pay.amount, pay.payment_date
FROM Bookings b
JOIN Users u ON u.user_id = b.user_id
JOIN Properties p ON p.property_id = b.property_id
LEFT JOIN Payments pay ON pay.booking_id = b.booking_id

-- After analyzing the query performance, we can add indexes to improve it
CREATE INDEX idx_payment_booking ON payments(booking_id) ;

-- Refactored Query (Force index usage if needed)
SELECT 
    u.user_id, u.first_name, u.last_name, u.email,
    p.property_id, p.name AS property_name, p.location,
    b.booking_id, b.start_date, b.end_date, b.status,
    pay.payment_id, pay.amount, pay.payment_date
FROM Bookings b
JOIN Users u ON u.user_id = b.user_id
JOIN Properties p ON p.property_id = b.property_id
LEFT JOIN Payments pay USE INDEX (idx_payment_booking) 
       ON pay.booking_id = b.booking_id;
