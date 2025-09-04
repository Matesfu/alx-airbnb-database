-- a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
select Bookings.Booking_id, u.user_id
from Users u
inner join Bookings on Bookings.user_id = u.user_id

-- a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
select Properties.property_id, Reviews.rating, reviews.comment
from Properties
left join Reviews on Properties.property_id = Reviews.property_id

-- a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
select Users.user_id, Users.first_name, bookings.booking_id
from users
FULL OUTER JOIN bookings on Users.user_id = bookings.user_id