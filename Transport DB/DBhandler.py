# -*- coding: UTF-8 -*-
import mysql.connector
from mysql.connector import errorcode
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


# for later usage maybe
"""
def menu():
    print("\n\n\n\tMENU\n\t(1) Vehicles Coming From...\n\t(2) Vehicles Going To...\n\t(3) All Travels By Date\n\t\
    (4) User's Travel Infos\n\t(5) Vehicle's Routes\n\t(0) Exit")
    user_choice = ""
    while user_choice == "":
        user_choice = input("\n\t> ")
        if not user_choice.isdigit() or int(user_choice) not in range(6):
            clear()
            print("\n\n\n\tExcuse me? ")
            time.sleep(1)
            user_choice = ""
            clear()
        elif user_choice == "1":
            pass
        elif user_choice == "2":
            pass
        elif user_choice == "3":
            pass
        elif user_choice == "4":
            pass
        elif user_choice == "5":
            pass
        elif user_choice == "0":
            pass
"""

QUERY_ALL_TRAVELS = "SELECT people.Name AS Person, locationsfrom.Name AS FromHere, locationsto.Name AS ToHere, " \
                    "date(transport.DepartDate) AS OnDate, vehicles.Name AS Car FROM people INNER JOIN transport ON " \
                    "people.ID = transport.PersonID INNER JOIN locationsfrom ON transport.DepartLocationID = locationsfrom.ID " \
                    "INNER JOIN locationsto ON transport.ArrivalLocationID = locationsto.ID INNER JOIN vehicles ON " \
                    "transport.VehicleID = vehicles.ID"

clear()
print("\n\n\n\t Welcome to Transport Database!\n\tPreparing the Database for you...")
time.sleep(1)
clear()
try:
    cnx = mysql.connector.connect(user='root', password="F0i1b1o2n3a5c8c13i21")
    cursor = cnx.cursor()
    run_sql_file("create.sql", cursor)
    if not is_table_filled(cursor, "transport"):
        run_sql_file("insert.sql", cursor)
    cnx.commit()
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    else:
        print(err)

try:
    cnx = mysql.connector.connect(user='root', password="F0i1b1o2n3a5c8c13i21", database="transportpeople")
    cursor = cnx.cursor(buffered=True)
    cursor.execute(QUERY_ALL_TRAVELS)
    travel_list = cursor.fetchall()
    print("\n\n\n\tAll travel records:\n")
    for travel in travel_list:
        print("\t{} travels from {} to {} on {} in {}.".format(travel[0], travel[1], travel[2], travel[3], travel[4]))
    input("\n\tPress Enter to Exit.")
    clear()
except mysql.connector.Error as err:
    print(err)
