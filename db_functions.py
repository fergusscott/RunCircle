USER = 'root' 
PASSWORD = 'runcircle123'
HOST = 'localhost'
DATABASE = 'run_circle'

import mysql.connector
from mysql.connector import errorcode
from InsertRun import InsertRun

def main():
    connection = mysql.connector.connect(user = USER, 
    password = PASSWORD, host = HOST, database = DATABASE)

    InsertRun(connection, [3, 3, '00:27:05', 3.05, '00:04:23', None, 3, 1, None, None])
    
    connection.close()

main()

