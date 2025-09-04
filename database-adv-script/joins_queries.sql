-- a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT Bookings.Booking_id, u.user_id
FROM Users u
INNER JOIN Bookings ON Bookings.user_id = u.user_id

-- a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
SELECT Properties.property_id, Reviews.rating, reviews.comment
FROM Properties
LEFT JOIN Reviews ON Properties.property_id = Reviews.property_id
ORDER BY Reviews.rating DESC

-- a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT Users.user_id, Users.first_name, bookings.booking_id
FROM users
FULL OUTER JOIN bookings ON Users.user_id = bookings.user_id
ORDER BY Users.user_id

