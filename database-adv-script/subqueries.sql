-- a query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT *
from Properties
where Properties.property_id IN (
	SELECT Reviews.property_id
	FROM Reviews
    WHERE Reviews.rating > 4.0
)

-- a correlated subquery to find users who have made more than 3 bookings.
SELECT u.User_id, u.first_name
FROM users u
WHERE 3 < (
    SELECT COUNT(*)
    FROM Bookings b
    WHERE b.user_id = u.user_id
)