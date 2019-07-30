'''
    Insert Run function.
'''

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

    # This should come from the session
    user_id_param = list_of_arg[0]
    profile_id_param = list_of_arg[1]

    # Running parameters
    duration_param = list_of_arg[2]
    distance_in_miles_param = list_of_arg[3]
    circle_id_param = list_of_arg[4]
    elevation_param = list_of_arg[5]
    location_id_param = list_of_arg[6]
    smart_integration_param = list_of_arg[7]
    scheduled_date_param = list_of_arg[8]

    cursor.execute("CALL InsertRow({}, {}, {}, {}, {}, {}, {}, {}, {})".format(
         user_id_param, profile_id_param, duration_param, distance_in_miles_param, circle_id_param,
         elevation_param, location_id_param, smart_integration_param, scheduled_date_param))

    cursor.close()
        
