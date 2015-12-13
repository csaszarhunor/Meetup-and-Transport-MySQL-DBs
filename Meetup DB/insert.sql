USE MeetupSystemDB;

INSERT INTO statuses (Id, Value) VALUES (1, "Going"), (2, "Tentative"), (3, "Not going"), (4, "Presenting");

INSERT INTO users (Id, Name, Birthdate, Introduction, Avatar, Email) 
VALUES (1, "Levay Nora", "1955.11.29", NULL, "I am Levay Nora, you know. You don't know me!", NULL), 
(2, "Fenyvesi Nyek", "1996.04.12", "Hi. My name is Nyek.", "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.", "fenyek@freemail.hu"), 
(3, "Papp Zsofika", "1945.06.05", "Zsofika vagyok, hosszu o-val. Lesszives akkent kezelni.", NULL, "PappZsofika@armyspy.com"), 
(4, "Laszlo Patrik", "1988.03.18", "Random random random random", "Patrikkkkkkkkkkkkkkkkkk kkkkkk kkkkkkkkkkkkk. kkkkkkkkkkkk kkkkkkkk kkkkkkkkkkkkkkkkkkk kkkkkkk kkkkkkkkk, kkkkkkk kkkkkkkkkkk.", "LaszloPatrik@dayrep.com"), 
(5, "Vagner Bertalan", "1992.02.28", NULL, NULL, NULL), 
(6, "Csaszar Hunor Tamas", "1990.02.26", "I am the creator of this database.", "Yes.", "csaszarhunor@gmail.com");

INSERT INTO meetups (Id, Start, Location, Topic, Description) 
VALUES (1, "2015.06.12 12:00:00", "Miskolc, Regiposta utca, valamennyi", "Valamilyen talalka", "Valakik valamit csinalnak valahol valamikor."), 
(2, "2015.09.12 12:00:00", "Miskolc, valahol", "Masodik valamilyen talalka", "Valami olyan jol sikerult multkor, hogy valami"), 
(3, "2015.12.10 15:00:00", "Miskolc, Codecool", "Weekly Feedback", "Don't dare to forget again"), 
(4, "2015.12.12 23:59:59", "Everywhere", "New Years Eve", "Last minutes of the year. Time passes by quickly, how big you grew, Lajoska! *Tap, Tap*"), 
(5, "2016.01.23 12:00:00", "Anywhere", "Lunch", "Let's dine! Ebedeljunk! Hai sa mancam! Andiamo a pranzare!");

INSERT INTO meetupregistration (Id, Meetup, UserId, StatusId) 
VALUES (DEFAULT, 1, 2, 1), (DEFAULT, 1, 4, 2), (DEFAULT, 1, 5, 4), 
(DEFAULT, 2, 2, 2), (DEFAULT, 2, 4, 4), (DEFAULT, 2, 5, 1), 
(DEFAULT, 3, 6, 1), 
(DEFAULT, 4, 1, 2), (DEFAULT, 4, 2, 4), (DEFAULT, 4, 3, 1), (DEFAULT, 4, 4, 2), (DEFAULT, 4, 5, 4), (DEFAULT, 4, 6, 4), 
(DEFAULT, 5, 1, 2), (DEFAULT, 5, 2, 4), (DEFAULT, 5, 3, 1), (DEFAULT, 5, 4, 2), (DEFAULT, 5, 5, 4), (DEFAULT, 5, 6, 3);