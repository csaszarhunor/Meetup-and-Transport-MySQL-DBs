USE MeetupSystemDB;

SELECT id, name, email FROM users WHERE Email IS NOT NULL ORDER BY name;

SELECT Id, Topic, Start, Location FROM meetups ORDER BY Start;

SELECT meetups.Topic AS Meetup, users.Name AS User, statuses.Value AS Status
FROM meetupregistration INNER JOIN meetups 
ON meetupregistration.Meetup = meetups.Id INNER JOIN users
ON meetupregistration.UserId = users.Id INNER JOIN statuses
ON meetupregistration.StatusId = statuses.Id
WHERE meetups.Id = 5 ORDER BY statuses.Value;

SELECT users.Name AS User, meetups.Topic AS Meetup, meetups.Start AS Time , statuses.Value AS Status
FROM meetupregistration INNER JOIN meetups 
ON meetupregistration.Meetup = meetups.Id INNER JOIN users
ON meetupregistration.UserId = users.Id INNER JOIN statuses
ON meetupregistration.StatusId = statuses.Id
WHERE users.Id = 2 ORDER BY meetups.Start;

SELECT users.Name, YEAR(CURRENT_TIMESTAMP) - YEAR(users.Birthdate) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(users.Birthdate, 5)) as age 
FROM users;
