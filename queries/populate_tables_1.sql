insert 
	into Customers
		(CustomerID, FirstName, LastName, Email, PhoneNumber, Address)
	values
		(1, 'Alex', 'Matovic', 'a.matovits@gmail.com', '123456789', 'Super Str. 91'),
        (2, 'Marie', 'Heisenberg', 'im.marie@email.net', '987654321', 'Neat Str. 11'),
        (3, 'John', 'Doe', 'not.a.joe@notmail.not.com', '88888888', 'Default Str. 1');

insert
	into Employees
		(EmployeeID, FirstName, LastName, Role, Salary)
	values
		(1, 'Steve', 'Cooker', 'Waiter', 30000),
        (2, 'Nate', 'Dinnerplate', 'Receptionist', 30000),
        (3, 'Bob', 'Beans', 'Shef', 40000),
        (4, 'Jonas', 'Smart', 'Manager', 35000),
        (5, 'Ross', 'Boss', 'Boss', 50000);

insert
	into Bookings 
        (BookingID, BookingSlot, BookingDate, TableNo, EmployeeID, CustomerID)
	values 
		(1, '20:00', '2022-10-10', 5, 1, 1),
        (2, '19:00', '2022-11-12', 3, 1, 3),
        (3, '18:00', '2022-10-11', 2, 1, 2),
        (4, '20:00', '2022-10-13', 2, 1, 1);