'''
    Python code for findRunFriend
'''
import mysql.connector
from mysql.connector import errorcode

USER = 'root' # You probably don't have to change this.
PASSWORD = 'runcircle123' # Put your password here.
HOST = 'localhost' # Try with Localhost, if it doesn't work, open the database in
# Workbench. Click "Database" and then "Manage Connection" and you'll see a hostname.
# That is what goes in the host variable.
DATABASE = 'run_circle' # Obviously change this to whatever you want, as long as it matches.

def findRunFriend(profile_id):
    '''
    Using the profile_id only, we should be able to 
    retrieve some running friends.
    Parameters: Profile_id (INT)
    Returns: List of rows (list of lists) from 
        the database. If this was connected to a GUI,
        the first index would be the best match, and could
        be displayed from 0 to n.
        If there is no match, the function returns an empty list.
        Handle this in the front-end to display that there is no match.
    Does: Selects a table with the best matches for the particular
        user based on our top secret patented algorithm.
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
        cursor.callproc('findRunFriend', (profile_id,))
        for result in cursor.stored_results():
            result_lst = result.fetchall()
        
        # At this point, result list is a list of tuples, where
        # each tuple is a row from the result set. 
        return result_lst
    except:
        print("There was no result to show!")

    cursor.close()
    connection.close()
    
# *Src: https://stackoverflow.com/questions/47174293/call-mysql-stored-procedure-using-cursor-callproc-in-python

    
