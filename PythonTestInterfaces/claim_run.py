'''
    ClaimRun in Python
'''

import mysql.connector
from mysql.connector import errorcode

# Connection globals
USER = 'root' 
PASSWORD = 'runcircle123' 
HOST = 'localhost' 
DATABASE = 'run_circle'

def claimRun(run_id, profile_id):
    ''' claimRun
    Parameters: run_id (int) and profile_id (int)
    Output: None
    Does: Connects a run with a profile in MySQL.
    '''

    DBconfig = {
    'user': USER,
    'password': PASSWORD,
    'host': HOST,
    'database': DATABASE
    }

    try:
        # Here I am "dereferencing" the dictionairy I made.
        connection = mysql.connector.connect(**DBconfig)
    # Handle potential errors.
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(err)
        return

    cursor = connection.cursor()
    cursor.callproc('claimRun', (run_id, profile_id,))
    connection.commit()
    cursor.close()
    connection.close()