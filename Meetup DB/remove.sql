USE MeetupSystemDB;

DELETE FROM meetupregistration WHERE UserId = 4;
DELETE FROM users WHERE Id = 4;

DELETE FROM meetupregistration WHERE Meetup = 2;
DELETE FROM meetups WHERE Id = 2;
