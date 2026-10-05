CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(255) NOT NULL,
    member_phone_number VARCHAR(50),
    member_email VARCHAR(255),
    CONSTRAINT ix_members_email UNIQUE (member_email)
);

CREATE TABLE Reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    reservation_date DATE NOT NULL,
    reservation_status VARCHAR(50) DEFAULT 'Available' 
        CHECK (reservation_status IN ('Available', 'Reserved'))
    
);

CREATE INDEX ix_reservations_book_id ON Reservations(book_id);
CREATE INDEX ix_reservations_member_id ON Reservations(member_id);

CREATE TABLE Borrowings (
    borrowing_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    copy_id INT NOT NULL,
    borrowing_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE
    
);

CREATE INDEX ix_borrowings_member_id ON Borrowings(member_id);
CREATE INDEX ix_borrowings_copy_id ON Borrowings(copy_id);
