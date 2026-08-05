INSERT INTO Customers (CustomerID, FullName, ContactNumber, Email)
VALUES
(1, 'Ahmed Ali', '1111111111', 'ahmed@example.com'),
(2, 'Sara Mohamed', '2222222222', 'sara@example.com'),
(3, 'Omar Hassan', '3333333333', 'omar@example.com');


INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
VALUES
(1, '2022-10-10', 5, 1),
(2, '2022-11-12', 3, 3),
(3, '2022-10-11', 2, 2),
(4, '2022-10-13', 2, 1);



DELIMITER //

CREATE PROCEDURE CheckBooking(
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    DECLARE booking_count INT;

    SELECT COUNT(*)
    INTO booking_count
    FROM Bookings
    WHERE BookingDate = booking_date
      AND TableNumber = table_number;

    IF booking_count > 0 THEN
        SELECT CONCAT('Table ', table_number, ' is already booked') AS BookingStatus;
    ELSE
        SELECT CONCAT('Table ', table_number, ' is available') AS BookingStatus;
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE AddValidBooking(
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    DECLARE booking_count INT;

    START TRANSACTION;

    SELECT COUNT(*)
    INTO booking_count
    FROM Bookings
    WHERE BookingDate = booking_date
      AND TableNumber = table_number;

    IF booking_count > 0 THEN
        ROLLBACK;
        SELECT 'Booking declined. Table is already booked.' AS BookingStatus;
    ELSE
        INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
        VALUES (booking_date, table_number, 1);

        COMMIT;
        SELECT 'Booking successful.' AS BookingStatus;
    END IF;
END //

DELIMITER ;