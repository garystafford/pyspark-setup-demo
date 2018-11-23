#!/usr/bin/python

import psycopg2

# source: https://stackoverflow.com/questions/45805871/python3-psycopg2-execute-sql-file

connect_str = 'host=postgres port=5432 dbname=demo user=postgres password=postgres1234'
conn = psycopg2.connect(connect_str)
conn.autocommit = True
cursor = conn.cursor()

sql_file = open('bakery_sample.sql', 'r')
sqlFile = sql_file.read()
sql_file.close()
sqlCommands = sqlFile.split(';')
for command in sqlCommands:
    print(command)
    if command.strip() != '':
        cursor.execute(command)
