CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_booking_user ON Bookings(user_id);
CREATE INDEX idx_booking_property ON Bookings(property_id);
CREATE INDEX idx_bookings_dates ON Bookings(start_date, end_date);
CREATE INDEX idx_property_user ON Properties(host_id);
CREATE INDEX idx_property_location ON Properties(location);


-- Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE
EXPLAIN SELECT * 
FROM Bookings 
WHERE user_id = 5;

EXPLAIN SELECT * 
FROM Properties 
WHERE location = 'Addis Ababa';

EXPLAIN SELECT *
FROM Bookings
WHERE property_id = 10 AND start_date >= '2023-01-01' AND end_date <= '2023-12-31';

EXPLAIN SELECT *
FROM Properties
WHERE host_id = 3;
