# -*- coding: UTF-8 -*-
import mysql.connector
from mysql.connector import errorcode
import datetime
import os
import time
clear = lambda: os.system('cls')


def run_sql_file(sql_file, cursor_object):
    with open(sql_file, "r") as file:
        commands = file.read()
    split_commands = commands.split(";")
    for command in split_commands:
            cursor_object.execute(command)


def is_table_filled(cursor_object, table_name):
    count_row_in_sql = "SELECT count(*) FROM {}".format(table_name)
    cursor_object.execute(count_row_in_sql)
    row_num = cursor_object.fetchone()[0]
    return row_num


def query_meetups_for_a_user(id):
    result = ("SELECT users.Name AS User, meetups.Topic AS Meetup, statuses.Value AS Status "
              "FROM meetupregistration INNER JOIN users ON meetupregistration.UserId = users.Id "
              "INNER JOIN meetups ON meetupregistration.Meetup = meetups.Id "
              "INNER JOIN statuses ON meetupregistration.StatusId = statuses.Id "
              "WHERE users.Id = {};".format(int(id)))
    return result

date = datetime.datetime.strptime("2015.11.27", "%Y.%m.%d")
QUERY_MEETUPS_AFTER_GIVEN_DATE = ("SELECT meetups.Start, meetups.Location, meetups.Topic \
FROM meetups WHERE meetups.Start > '{}';".format(date))
QUERY_USERS_WITH_INTRO = "SELECT users.Name, users.Introduction FROM users WHERE Introduction IS NOT NULL;"
MENU = "\n\n\n\tEnter:\n\t(1) For all meetup registrations of a particular user\n\t(2) For meetups after \
2015.11.27\n\t(3) For users with introduction\n\t(0) To Exit\n\n\t> "

clear()
print("\n\n\n\tCreating Demo Database...")
time.sleep(1.5)
clear()
try:
    cnx = mysql.connector.connect(user='root', password="F0i1b1o2n3a5c8c13i21")
    cursor = cnx.cursor()
    run_sql_file("create.sql", cursor)
    if not is_table_filled(cursor, "users"):
        run_sql_file("insert.sql", cursor)
    cnx.commit()
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    else:
        print(err)
else:
    cnx.close()
    cursor.close()

user_input = ""
while user_input == "":
    user_input = input(MENU)
    clear()
    if not user_input.isdigit() or int(user_input) not in (0, 1, 2, 3):
        print("\n\n\n\tExcuse me?")
        time.sleep(1.5)
        clear()
        user_input = ""
    elif user_input == "0":
        exit()
    try:
        cnx = mysql.connector.connect(user='root', password="F0i1b1o2n3a5c8c13i21", database="meetupsystemdb")
        cursor = cnx.cursor(buffered=True)
        if user_input == "1":
            user_number = is_table_filled(cursor, "users")
            if user_number:
                user_id = ""
                while user_id == "":
                    user_id = input("\n\n\n\tEnter user's number (from 1 to {}):\n\n\t> ".format(user_number))
                    clear()
                    if not user_id.isdigit() and int(user_id) not in range(1, user_number + 1):
                        print("Excuse me?")
                        time.sleep(1.5)
                        clear()
                        user_id = ""
                    cursor.execute(query_meetups_for_a_user(user_id))
                    users_meetups = cursor.fetchall()
                    print("\n\n\n\t{}'s meetup(s) and planned attendance: \n".format(users_meetups[0][0]))
                    for meetup in users_meetups:
                        print("\t", meetup[1], ", ", meetup[2])
                    time.sleep(5)
                    clear()
                    user_input = ""
                    continue
            else:
                print("\n\n\n\t0 users in Database :(")
                time.sleep(1.5)
                clear()
                user_input = ""
                continue
        elif user_input == "2":
            meetup_number = is_table_filled(cursor, "meetups")
            if meetup_number:
                cursor.execute(QUERY_MEETUPS_AFTER_GIVEN_DATE)
                meetups_after = cursor.fetchall()
                print("\n\n\n\tMeetups after {}: \n".format(date.date()))
                for meet_up in meetups_after:
                    print("\t", meet_up[0], "| ", meet_up[1], "| ", meet_up[2])
                time.sleep(5)
                clear()
                user_input = ""
                continue
            else:
                print("\n\n\n\t0 meetups in Database :(")
                time.sleep(1.5)
                clear()
                user_input = ""
                continue
        elif user_input == "3":
            user_number = is_table_filled(cursor, "users")
            if user_number:
                cursor.execute(QUERY_USERS_WITH_INTRO)
                intro_users = cursor.fetchall()
                print("\n\n\n\tUsers' introduction: \n")
                for users in intro_users:
                    print("\t", users[0], ": ", users[1])
                time.sleep(5)
                clear()
                user_input = ""
                continue
            else:
                print("\n\n\n\t0 meetups in Database :(")
                time.sleep(1.5)
                clear()
                user_input = ""
                continue
    except mysql.connector.Error as err:
        print(err)
    else:
        cnx.close()
        cursor.close()
