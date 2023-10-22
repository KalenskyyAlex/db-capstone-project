CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(b_id int, c_id int, b_date date, t_no int)
begin
	declare already_booked int;
    
    select ValidBooking(b_date, t_no) into already_booked;
    
	start transaction;
    
    insert 
		into Bookings
			(BookingID, BookingSlot, BookingDate, TableNo, EmployeeID, CustomerID)
		values
			(b_id, '18:00', b_date, t_no, 1, c_id);
            
	if already_booked = 1 then rollback;
    else commit;
    end if;
end