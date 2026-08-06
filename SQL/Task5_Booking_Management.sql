DELIMITER //

CREATE PROCEDURE AddBooking(
    IN booking_id INT,
    IN customer_id INT,
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    INSERT INTO Bookings
        (BookingID, CustomerID, BookingDate, TableNumber)
    VALUES
        (booking_id, customer_id, booking_date, table_number);

    SELECT 'New booking added' AS Confirmation;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE ManageBooking(
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    START TRANSACTION;

    IF EXISTS (
        SELECT 1
        FROM Bookings
        WHERE BookingDate = booking_date
          AND TableNumber = table_number
    ) THEN
        ROLLBACK;
        SELECT CONCAT(
            'Table ',
            table_number,
            ' is already booked - booking cancelled.'
        ) AS Message;
    ELSE
        INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
        VALUES (booking_date, table_number, 1);

        COMMIT;

        SELECT 'Booking successful.' AS Message;
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN booking_id INT,
    IN booking_date DATE
)
BEGIN
    UPDATE Bookings
    SET BookingDate = booking_date
    WHERE BookingID = booking_id;

    SELECT CONCAT('Booking ', booking_id, ' updated') AS Confirmation;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN booking_id INT
)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = booking_id;

    SELECT CONCAT('Booking ', booking_id, ' cancelled') AS Confirmation;
END //

DELIMITER ;