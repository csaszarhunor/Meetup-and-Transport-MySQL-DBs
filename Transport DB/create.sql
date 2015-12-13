CREATE DATABASE IF NOT EXISTS TransportPeople;

USE TransportPeople;

CREATE TABLE IF NOT EXISTS Vehicles 
(ID INTEGER AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
Capacity INTEGER NOT NULL);

CREATE TABLE IF NOT EXISTS People
(ID INTEGER AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(100) NOT NULL);

CREATE TABLE IF NOT EXISTS LocationsTo
(ID INTEGER AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(100) NOT NULL);

CREATE TABLE IF NOT EXISTS LocationsFrom
(ID INTEGER AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(100) NOT NULL);

CREATE TABLE IF NOT EXISTS Transport
(ID INTEGER AUTO_INCREMENT PRIMARY KEY,
DepartDate DATETIME NOT NULL,
DepartLocationID INTEGER NOT NULL, CONSTRAINT FOREIGN KEY (DepartLocationID) REFERENCES LocationsFrom(ID),
ArrivalLocationID INTEGER NOT NULL, CONSTRAINT FOREIGN KEY (ArrivalLocationID) REFERENCES LocationsTo(ID),
PersonID INTEGER NOT NULL, CONSTRAINT FOREIGN KEY (PersonID) REFERENCES People(ID),
VehicleID INTEGER NOT NULL, CONSTRAINT FOREIGN KEY (VehicleID) REFERENCES Vehicles(ID));