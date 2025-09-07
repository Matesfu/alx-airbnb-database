DROP TABLE Bookings; -- Drop the existing Bookings table if it exists
CREATE TABLE Bookings (
    booking_id serial primary key,
    property_id int not null,
    user_id int not null,
    start_date date not null,
    end_date date not null,
    total_price decimal(10, 2) not null,
    status ENUM('pending', 'confirmed', 'cancelled') default 'pending' not null,
    created_at TIMESTAMP default CURRENT_TIMESTAMP,
    foreign key (property_id) references Properties(property_id) on delete cascade,
    foreign key (user_id) references Users(user_id) on delete cascade,
    KEY idx_start_date (start_date)
);
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax  VALUES LESS THAN MAXVALUE
);
-- Example query to test performance on partitioned table
EXPLAIN SELECT *
FROM Bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';
