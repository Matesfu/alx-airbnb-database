INSERT INTO Users (first_name, last_name, email, password_hash, phone_number, role) VALUES
('Abebe', 'Alemu', 'abe13alemu@gmail.com', 'hashed_password1', '1234567890', 'host'),
('Ashenafi', 'Kebede', 'ashenafi.kebe@example.com', 'hashedpassword456', '0987654321', 'host'),
('Kalab', 'Hailu', 'kalab.hailu@example.com', 'hashedpassword789', '1112223333', 'host'),
('Mentesnot', 'Wolde', 'mentesnot.wolde@example.com', 'hashedpassword321', '2223334444', 'guest'),
('Admin', 'User', 'admin@example.com', 'hashedadminpassword', '9998887777', 'admin');

INSERT INTO Properties (host_id, name, description, location, price_per_night) VALUES
(2, 'Apartment', 'A comfortable 2-bedroom apartment in the city center.', 'AA, Lideta', 120.00),
(2, 'Beachside Villa', 'Luxury villa with ocean view and private pool.', 'Arba Minch, Roha', 350.00),
(3, 'Mountain Cabin', 'Quiet and peaceful cabin near hiking trails.', 'Gonder, Gayenet', 150.00),
(4, 'Apartment', 'Modern studio apartment close to attractions.', 'AA, Bole', 100.00);

INSERT INTO Bookings (property_id, user_id, start_date, end_date, total_price, status) VALUES
(1, 1, '2025-09-05', '2025-09-10', 600.00, 'confirmed'),
(2, 4, '2025-09-15', '2025-09-20', 1750.00, 'pending'),
(3, 1, '2025-10-01', '2025-10-05', 600.00, 'confirmed');

INSERT INTO Payments (booking_id, amount, payment_date, payment_method) VALUES
(1, 600.00, '2025-09-07','paypal'),
(3, 600.00, '2025-10-01', 'credit_card');

INSERT INTO Reviews (property_id, user_id, rating, comment) VALUES
(1, 1, 5, 'Amazing apartment! Very clean and great location.'),
(3, 1, 4, 'Cozy cabin, but Wi-Fi was a bit slow.');

INSERT INTO Messages (sender_id, recipant_id, message_body)
VALUES
(1, 2, 'Hi, is the apartment available for next week?'),
(2, 1, 'Yes, it is available from 5th to 10th September.');