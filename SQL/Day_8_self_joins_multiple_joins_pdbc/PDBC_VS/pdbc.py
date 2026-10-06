import mysql.connector
from mysql.connector import Error

try:
    conn= mysql.connector.connect(
        user='root',
        password='1111',
        host='localhost',
        port='3306')
    if conn.is_connected():
        print('connected the DB')
    cur= conn.cursor()
    cur.execute('create database pdbc_vs')
    cur.execute('use pdbc_vs')
    cur.execute('create table student(id int, name varchar(20), marks int)')
    cur.execute("insert into student values (1,'k',2),(2,'a',4),(3,'h',7)")
    conn.commit() #very important to save this in the data base 

except Error as msg:
    print(msg)
    print('DB not connected')