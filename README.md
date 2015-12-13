Introduction
============

This is a school project (www.codecool.com) for learning the basics of MySQL and 
Relational Database Languages in general. It consists of two main tasks: 
Meetup DB and Transport DB.


Meetup Database
=====

Meetup Database has four tables, three of which contain the actual Data of the Meetups,
and one which handles the references between the other three.
The table Meetups contains the Start, Location, Topic, Description of every meetups
and a unique key for reference.
The table Statuses contains the attendance status possibilities and unique key for reference.
The table Users contains the Name, Birtdate and a unique key, and the optional columns 
Introduction, Avatar and Email.
The Meetup Registration Table has a unique key column and three foreign key columns referencing 
to the other tables by their primary keys. Therefore this table consists of all the data 
which can be obtained about a meetup including information about the meetups themselves, 
the participant users and their statuses concerning their attendance to particular meetup.


Transport Database
====================================

Transport Database's structure is very similar to Meetup Database's. It consists of five tables
altogether, one of which handles the relation among the others.
Vehicles, People, LocationsFrom and LocationsTo tables all contain a unique ID and a Name column, 
the Vehicles table also contains a Capacity column to inform about the number of passengers a vehicle 
can carry. 
The table Transport has columns for a unique ID, Depart Date and the foreign keys pointing to the
other tables' primary key. Therefore this table consists of all the data which can be 
obtained about a particular journey.
Originally this was a custom task and the theme for it was up to me. I came up with this idea
from a table informing an event's participants when, with who, and by which car they go to this
event. Eventually it is a basic carpooling system.


Contact
========================================

If you have problems, questions, ideas or suggestions, please contact me on csaszarhunor@gmail.com
