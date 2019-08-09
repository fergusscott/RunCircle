'''
    Find circle in Python!
'''

import mysql.connector
from mysql.connector import errorcode

# Globals to use in the function. Probably should not be stored here,
# but for the purpose of the project, they can be here.
USER = 'root'
PASSWORD = 'runcircle123' 
HOST = 'localhost'
DATABASE = 'run_circle'

def findCircle(profile_id):
    ''' findCircle
    Parameters: The profile ID of the person searching.
    Returns: A result set of matches, as a list of tuples.
        If there are NO matches, the result set is an empty list.
        This should be handled in the front end! (as in, display
        'no matches').
    Does: Uses a top secret algorithm to find nearby, matching
        running circles for the user.
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
    
    # Set up the iterating cursor.
    cursor = connection.cursor(buffered=True)

    # FUN FACT OF THE DAY - Did you know python requires a comma after an argument
    # to deem it a tuple? Otherwise, it just thinks it's an order-of-opertion parenthesis*.
    try:
        cursor.callproc('findRunCircle', (profile_id,))
        for result in cursor.stored_results():
            result_lst = result.fetchall()
        
        # At this point, result list is a list of tuples, where
        # each tuple is a row from the result set. 
        # Close the connection and return the lst.
        cursor.close()
        connection.close()    
        return result_lst
    except:
        print("There was no result to show!")
    
    # Either we have returned, or something went wrong.
    # Still close the connections.
    cursor.close()
    connection.close() 
