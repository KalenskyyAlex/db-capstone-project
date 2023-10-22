CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelOrder`(id INT)
BEGIN
	DELETE FROM Orders WHERE OrderID = id;
END