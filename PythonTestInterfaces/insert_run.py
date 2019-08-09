'''
    Insert Run function.
'''

import mysql.connector
from mysql.connector import errorcode

# Globals to use in the function. Probably should not be stored here,
# but for the purpose of the project, they can be here.
USER = 'root'
PASSWORD = 'runcircle123' 
HOST = 'localhost'
DATABASE = 'run_circle'


def InsertRun(list_of_arg):
    '''
    Parameters: A list of arguments. Order of arguments should be:
        - user_id_param (integer)
	    - profile_id_param (integer),
	    - duration_param (integer),
        - distance_in_miles_param (float),
        - circle_id_param (integer),
        - elevation_param (integer),
        - location_id_param (integer),
        - smart_integration_param (integer),
        - scheduled_date_param DATETIME
        This would be acquired through a frontend that
        has to assemble a list accordinly.
    Returns: Nothing
    Does: Adds a run with the passed parameters to the DB.
    '''

    # Set up dictionairy of connection data.
    DBconfig = {
    'user': USER,
    'password': PASSWORD,
    'host': HOST,
    'database': DATABASE
    }

    try:
        # Here I am "dereferencing" the dictionairy I made.
        connection = mysql.connector.connect(**DBconfig)
    # Handle errors.
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(err)
        return
    

    cursor = connection.cursor()

    # Cause I know the args are correct, for now
    arg_tup = tuple(list_of_arg)

    try:
        cursor.callproc("InsertRun", arg_tup)
        connection.commit()
        cursor.close()
    except mysql.connector.Error as err:
        print("Something went crazy: {}".format(err))

    cursor.close()
    connection.close()
    
        
