-- ROLE table
CREATE TABLE role (
    role_id UUID PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL
);

-- Index for fast lookup on role_name
CREATE INDEX idx_role_name ON role(role_name);


-- USERS table
CREATE TABLE users (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    role_id UUID NOT NULL,
    FOREIGN KEY (role_id) REFERENCES role(role_id) ON DELETE SET NULL
);

-- Indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role_id ON users(role_id);


-- PROPERTY table
CREATE TABLE property (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL CHECK (price_per_night >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Indexes
CREATE INDEX idx_property_host_id ON property(host_id);
CREATE INDEX idx_property_location ON property(location);


-- BOOKING_STATUS table
CREATE TABLE booking_status (
    status_id UUID PRIMARY KEY,
    status_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE INDEX idx_booking_status_name ON booking_status(status_name);


-- BOOKING table
CREATE TABLE booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL CHECK (end_date > start_date),
    total_price DECIMAL(10, 2) NOT NULL CHECK (total_price >= 0),
    status_id UUID NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (status_id) REFERENCES booking_status(status_id)
);

-- Indexes
CREATE INDEX idx_booking_user_id ON booking(user_id);
CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_booking_status_id ON booking(status_id);


-- PAYMENT_METHOD table
CREATE TABLE payment_method (
    method_id UUID PRIMARY KEY,
    method_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE INDEX idx_payment_method_name ON payment_method(method_name);


-- PAYMENT table
CREATE TABLE payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount >= 0),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    method_id UUID NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (method_id) REFERENCES payment_method(method_id)
);

-- Indexes
CREATE INDEX idx_payment_booking_id ON payment(booking_id);
CREATE INDEX idx_payment_method_id ON payment(method_id);


-- REVIEW table
CREATE TABLE review (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Indexes
CREATE INDEX idx_review_property_id ON review(property_id);
CREATE INDEX idx_review_user_id ON review(user_id);


-- MESSAGE table
CREATE TABLE message (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Indexes
CREATE INDEX idx_message_sender_id ON message(sender_id);
CREATE INDEX idx_message_recipient_id ON message(recipient_id);