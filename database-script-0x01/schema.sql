create table Users (
    user_id serial primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(100) unique not null,
    password_hash varchar(255) not null,
    phone_number varchar(15) not null,
    role ENUM('guest', 'host', 'admin') default 'guest' not null,
    created_at TIMESTAMP default CURRENT_TIMESTAMP
);

create table Properties (
    property_id serial primary key,
    host_id int not null,
    name varchar(100) not null,
    description text,
    location varchar(255) not null,
    price_per_night decimal(10, 2) not null,
    created_at TIMESTAMP default CURRENT_TIMESTAMP,
    updated_at TIMESTAMP default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    foreign key (host_id) references Users(user_id) on delete cascade
);

create table Bookings (
    booking_id serial primary key,
    property_id int not null,
    user_id int not null,
    start_date date not null,
    end_date date not null,
    total_price decimal(10, 2) not null,
    status ENUM('pending', 'confirmed', 'cancelled') default 'pending' not null,
    created_at TIMESTAMP default CURRENT_TIMESTAMP,
    foreign key (property_id) references Properties(property_id) on delete cascade,
    foreign key (user_id) references Users(user_id) on delete cascade
);

create table Payments (
    payment_id serial primary key,
    booking_id int not null,
    amount decimal(10, 2) not null,
    payment_date TIMESTAMP default CURRENT_TIMESTAMP,
    payment_method ENUM('creadit_card', 'paypal', 'stripe') not null,
    forign key (booking_id) references Bookings(booking_id)
);

create table Reviews (
    review_id serial primary key,
    property_id int not null,
    user_id int not null,
    rating int check (rating >= 1 and rating <=5) not null,
    comment text not null,
    created_at TIMESTAMP default CURRENT_TIMESTAMP,
    foreign key (property_id) references Properties(property_id),
    foreign key (user_id) references Users(user_id)
);

create table Messages (
    message_id serial primary key,
    sender_id int not null,
    recipant_id int not null,
    message_body text not null,
    sent_at TIMESTAMP default CURRENT_TIMESTAMP,
    foreign key (sender_id) references Users(user_id),
    foreign key (recipant_id) references Users(user_id)
);

create INDEX idx_user_email on Users(email);
create INDEX idx_booking_property on Bookings(property_id);
create INDEX idx_payment_booking on Payments(booking_id);
CREATE INDEX idx_bookings_user ON Bookings(user_id);
CREATE INDEX idx_properties_host ON Properties(host_id);