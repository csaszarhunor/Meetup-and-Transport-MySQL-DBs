USE MeetupSystemDB;

UPDATE users SET Introduction = "Name is Patrik. László Patrik." WHERE Id = 4;

UPDATE users SET Name = "Császár Hunor", Avatar = "I need to update something in this table, so here it is." WHERE Id = 6;

UPDATE meetups SET Location = "In a Restaurant", Topic = "Lunch Discussion and Feast" WHERE Id = 5;

UPDATE meetupregistration SET StatusId = 1 WHERE UserId = 1 AND Meetup = 5;
