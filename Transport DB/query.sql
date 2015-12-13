USE transportpeople;

SELECT vehicles.Name AS Vehicle, transport.DepartDate, locationsto.Name AS ToHere, vehicles.Capacity, 
(SELECT count(*) FROM transport WHERE DepartLocationID = 1 AND transport.VehicleID = vehicles.ID) AS TakenSeats
FROM vehicles INNER JOIN transport ON vehicles.Id = transport.VehicleID
INNER JOIN locationsto ON transport.ArrivalLocationID = locationsto.ID
INNER JOIN locationsfrom ON transport.DepartLocationID = locationsfrom.ID
WHERE locationsfrom.ID = 1 GROUP BY vehicles.Name;

SELECT vehicles.Name AS Vehicle, date(transport.DepartDate) AS Date, locationsfrom.Name AS FromHere, vehicles.Capacity, 
(SELECT count(*) FROM transport WHERE ArrivalLocationID = 4 AND transport.VehicleID = vehicles.ID) AS TakenSeats
FROM vehicles INNER JOIN transport ON vehicles.Id = transport.VehicleID
INNER JOIN locationsfrom ON transport.DepartLocationID = locationsfrom.ID
INNER JOIN locationsto ON transport.ArrivalLocationID = locationsto.ID
WHERE locationsto.ID = 4 GROUP BY vehicles.Name;

SELECT people.Name, transport.DepartDate, locationsfrom.Name, locationsto.Name 
FROM people INNER JOIN transport ON people.ID = transport.PersonID
INNER JOIN locationsfrom ON transport.DepartLocationID = locationsfrom.ID
INNER JOIN locationsto ON transport.ArrivalLocationID = locationsto.ID 
WHERE people.ID = 2;

SELECT people.Name FROM people INNER JOIN transport ON people.ID = transport.PersonID 
WHERE date(transport.DepartDate) = "2015.12.27" AND transport.VehicleID = 2;

SELECT vehicles.Name, vehicles.Capacity FROM vehicles WHERE vehicles.ID = 1;

SELECT vehicles.Name, transport.DepartDate, locationsfrom.Name AS FromHere, locationsto.Name AS ToHere FROM
vehicles INNER JOIN transport ON vehicles.ID = transport.VehicleID
INNER JOIN locationsfrom ON transport.DepartLocationID = locationsfrom.ID
INNER JOIN locationsto ON transport.ArrivalLocationID = locationsto.ID
WHERE vehicles.ID = 1 GROUP BY vehicles.Name;

SELECT vehicles.Name AS Vehicle, locationsfrom.Name AS Departure, locationsto.Name AS Destination FROM 
transport INNER JOIN locationsto ON transport.ArrivalLocationID = locationsto.ID
INNER JOIN locationsfrom ON transport.DepartLocationID = locationsfrom.ID
INNER JOIN vehicles ON transport.VehicleID = vehicles.ID
WHERE date(transport.DepartDate) = "2015.12.27" GROUP BY vehicles.Name;