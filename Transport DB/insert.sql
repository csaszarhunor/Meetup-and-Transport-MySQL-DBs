USE TransportPeople;

INSERT INTO locationsto (ID, Name) VALUES 
(1, "Bdpst"), (2, "Kcskmt"), (3, "Szklykrsztr"), (4, "Cskszrd");

INSERT INTO locationsfrom (ID, Name) VALUES 
(1, "Bdpst"), (2, "Kcskmt"), (3, "Szklykrsztr"), (4, "Cskszrd");

INSERT INTO people (ID, Name) VALUES 
(1, "Morfeusz"), (2, "Sólyom"), (3, "Sárkány"), (4, "Éndzsöl"), (5, "Silent"),
(6, "Pöröj"), (7, "Sópihe"), (8, "Agy"), (9, "Bé"), (10, "Páva"),
(11, "Elektron"), (12, "Rugó"), (13, "Tájszon"), (14, "Menya"), (15, "Fecske"),
(16, "Ütő"), (17, "Mustang"), (18, "Puma"), (19, "CséCsé"), (20, "Csernus"),
(21, "Berbécs"), (22, "Kökény");

INSERT INTO vehicles (ID, Name, Capacity) VALUES 
(1, "Ford", 5), (2, "Fácán", 4), (3, "Frederik", 5), (4, "Főnix", 4);

INSERT INTO transport (ID, DepartDate, DepartLocationID, ArrivalLocationID, PersonID, VehicleID) VALUES 
(1, "2015.12.27 9:00:00", 2, 4, 1, 1), (2, "2015.12.27 9:00:00", 2, 4, 2, 1), (3, "2015.12.27 9:00:00", 2, 4, 3, 1), 
(4, "2015.12.27 9:00:00", 2, 4, 4, 1), (5, "2015.12.27 9:00:00", 2, 4, 5, 1), (6, "2015.12.27 7:00:00", 1, 4, 6, 2), 
(7, "2015.12.27 7:00:00", 1, 4, 7, 2), (8, "2015.12.27 7:00:00", 1, 4, 8, 2), (9, "2015.12.27 7:00:00", 1, 4, 9, 2), 
(10, "2015.12.27 9:00:00", 2, 4, 10, 3), (11, "2015.12.27 9:00:00", 2, 4, 11, 3), (12, "2015.12.27 9:00:00", 2, 4, 12, 3), 
(13, "2015.12.27 9:00:00", 2, 4, 13, 3), (14, "2015.12.27 9:00:00", 2, 4, 14, 3), (15, "2015.12.27 7:00:00", 1, 4, 16, 4),
(16, "2015.12.27 7:00:00", 1, 4, 17, 4), (17, "2015.12.27 7:00:00", 1, 4, 18, 4);