#!/usr/bin/python

import psycopg2
# import csv

# source: https://stackoverflow.com/questions/45805871/python3-psycopg2-execute-sql-file

# connect_str = 'host=localhost port=5432 dbname=demo user=postgres password=postgres1234' # local testing
connect_str = 'host=postgres port=5432 dbname=demo user=postgres password=postgres1234' # Docker

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

# source: https://www.dataquest.io/blog/loading-data-into-postgres/
# the slow way...
# with open('BreadBasket_DMS.csv', 'r') as f:
#     reader = csv.reader(f)
#     next(reader)  # Skip the header row.
#     for row in reader:
#         cursor.execute(
#             "INSERT INTO bakery_basket (date, time, transaction, item) VALUES (%s, %s, %s, %s)",
#             row
#         )
#         print(cursor.command)
#         conn.commit()

# the fast way...
with open('BreadBasket_DMS.csv', 'r') as f:
    # Notice that we don't need the `csv` module.
    next(f) # Skip the header row.
    cursor.copy_from(f, 'bakery_basket', sep=',', columns=('date', 'time', 'transaction', 'item'))
    conn.commit()

command = 'SELECT * FROM public.bakery_basket LIMIT 1;'
cursor.execute(command)
recs = cursor.fetchall()
print(recs[0])