USE MeetupSystemDB;

ALTER TABLE meetups ADD COLUMN ExpectedParticipants INTEGER NULL;
ALTER TABLE meetups ADD COLUMN Participants INTEGER NULL;
