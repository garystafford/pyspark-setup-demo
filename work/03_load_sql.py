#!/usr/bin/python3

import psycopg2

# connect to database
connect_str = 'host=postgres port=5432 dbname=bakery user=postgres password=postgres1234'
conn = psycopg2.connect(connect_str)
conn.autocommit = True
cursor = conn.cursor()

# execute sql script
sql_file = open('bakery.sql', 'r')
sqlFile = sql_file.read()
sql_file.close()
sqlCommands = sqlFile.split(';')
for command in sqlCommands:
    print(command)
    if command.strip() != '':
        cursor.execute(command)

# import data from csv file
with open('BreadBasket_DMS.csv', 'r') as f:
    next(f)  # Skip the header row.
    cursor.copy_from(
        f,
        'transactions',
        sep=',',
        columns=('date', 'time', 'transaction', 'item')
    )
    conn.commit()

# confirm by selecting record
command = 'SELECT COUNT(*) FROM public.transactions;'
cursor.execute(command)
recs = cursor.fetchall()
print('Row count: %d' % recs[0])
