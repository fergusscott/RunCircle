'''
    Insert Run function.
'''

import mysql.connector
from mysql.connector import Error

def InsertRun(db_connector, list_of_arg):
    '''
        Order of arguments should be:
        - user_id_param (integer)
	    - profile_id_param (integer),
	    - duration_param (integer),
        - distance_in_miles_param (float),
        - circle_id_param (integer),
        - elevation_param (integer),
        - location_id_param (integer),
        - smart_integration_param (integer),
        - scheduled_date_param DATETIME
    '''

    cursor = db_connector.cursor()

    # Cause I know the args are correct, for now
    arg_tup = tuple(list_of_arg)

    try:
        cursor.callproc("InsertRun", arg_tup)
        db_connector.commit()
        cursor.close()
    except mysql.connector.Error as err:
        print("Something went crazy: {}".format(err))

    cursor.close()
    
        
