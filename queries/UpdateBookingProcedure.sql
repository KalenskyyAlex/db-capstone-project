CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking`(b_id int, b_d date)
begin
	update Bookings
    set BookingDate = b_d
    where BookingID = b_id;
end