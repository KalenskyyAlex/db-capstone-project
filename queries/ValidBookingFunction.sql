CREATE DEFINER=`root`@`localhost` FUNCTION `ValidBooking`(b_date date, t_no int) RETURNS int(11)
BEGIN
	if exists(
		select BookingID 
		from Bookings 
		where BookingDate = b_date and TableNo = t_no
	) then RETURN 1;
    end if;
return 0;
END