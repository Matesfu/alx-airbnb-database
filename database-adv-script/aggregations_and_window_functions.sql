-- a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT user_id, COUNT(*) as book_count
FROM bookings
GROUP BY user_id

-- a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
SELECT p.property_id, 
p.name as Property_name, 
COUNT(b.property_id) as booking_count, 
RANK() OVER (ORDER BY COUNT(b.property_id) DESC) as booking_rank
FROM Properties p
INNER JOIN Bookings b ON p.property_id = b.property_id
GROUP BY p.property_id
ORDER BY booking_rank