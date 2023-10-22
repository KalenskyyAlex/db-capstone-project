CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(b_id int)
BEGIN
	delete from Bookings
    where BookingID = b_id;
END