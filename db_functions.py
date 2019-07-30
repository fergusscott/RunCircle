USER = 'root' # You probably don't have to change this.
PASSWORD = 'runcircle123' # Put your password here.
HOST = '127.0.0.1' # Try with Localhost, if it doesn't work, open the database in
# Workbench. Click "Database" and then "Manage Connection" and you'll see a hostname.
# That is what goes in the host variable.
DATABASE = 'run_circle' # Obviously change this to whatever you want, as long as it matches.

import mysql.connector
from mysql.connector import errorcode
from InsertRun import InsertRun

def main():

    connection = mysql.connector.connect(user = USER, 
    password = PASSWORD, host = HOST, database = DATABASE)

    InsertRun(connection, [3, 3, 27.05, 3.05, None, 3, 1, None, None])

    connection.close()

main()

