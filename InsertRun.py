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

    user_id_param = list_of_arg[0]
    profile_id_param = list_of_arg[1]
    duration_param = list_of_arg[2]
    distance_in_miles_param = list_of_arg[3]
    circle_id_param = list_of_arg[4]
    