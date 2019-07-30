'''
    DB Project Test - Gonna show ya'll how to connect to a database using
    Python.
'''

# Imports - Get the mysql stuff. This needs to be installed first.
# Go here: https://dev.mysql.com/downloads/connector/python/
# Follw the instructions to install.
import mysql.connector
from mysql.connector import errorcode
import InsertRun

# Globals - put you info here and see if it works. You'll be connecting to
# the database running on your laptop.

USER = 'root' # You probably don't have to change this.
PASSWORD = 'runcircle123' # Put your password here.
HOST = 'localhost' # Try with Localhost, if it doesn't work, open the database in
# Workbench. Click "Database" and then "Manage Connection" and you'll see a hostname.
# That is what goes in the host variable.
DATABASE = 'PythonTest' # Obviously change this to whatever you want, as long as it matches.

# It all goes in here!
# The connection variable here will be the connection to the database.
connection = mysql.connector.connect(user = USER, 
    password = PASSWORD, host = HOST, database = DATABASE)

print("First connection: ", connection)
connection.close()

# Here is a different way of setting up the exact same thing
# but using a dictionairy.
DBconfig = {
  'user': USER,
  'password': PASSWORD,
  'host': HOST,
  'database': DATABASE,
}

# Also a good idea to use try-except clauses since things can go
# wrong.
try:
    # Here I am "dereferencing" the dictionairy I made. (I think)
  connection = mysql.connector.connect(**DBconfig)

# Make sure you import the ErrorCodes at the top of the file.
except mysql.connector.Error as err:
  if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
    print("Something is wrong with your user name or password")
  elif err.errno == errorcode.ER_BAD_DB_ERROR:
    print("Database does not exist")
  else:
    print(err)

print("Second connection: ", connection)

# Always close the connection when you're done with it.
connection.close()

# I'm gonna try to create a table.
# This is from our conceptual model, although I made some changes because
# we don't have the table to refer to when setting up foreign keys.
TABLES = {}
TABLES['run'] = (
    "CREATE TABLE run ("
    "run_id INT PRIMARY KEY AUTO_INCREMENT,"
    "duration FLOAT,"
    "pace_per_mile FLOAT,"
    "elevation INT,"
    "distance FLOAT,"
    "circle_id INT,"
    "location_id INT NOT NULL,"
    "smart_integration INT,"
    "actual_date DATETIME NULL,"
    "scheduled_time DATETIME NULL"
    ");"
)

# First, we need one of those cursors that maybe John mentioned
# in his lecture...
# 1. Set up a new connection.
cnction = mysql.connector.connect(**DBconfig)

# 2. Assign the cursor to a variable.
cursor = cnction.cursor()

# 3. Try to execute commands using the cursor object.
try:
    # Here, we're trying to "use" the Database.
    cursor.execute("USE {}".format(DATABASE))
    print("Successfully using {}".format(DATABASE))
except mysql.connector.Error as err:
    print("Something went wrong trying to use {}".format(DATABASE))

# Now loop through the dictionairy (even though it only has one entry)
# and assign a string as the big script we wrote. Then execute it.
for entry in TABLES:
    script = TABLES[entry]
    print("Trying to create {}".format(entry))
    try:
        cursor.execute(script)
        print("Success! Table: {} created.".format(entry))
    except mysql.connector.Error as err:
        print("Something went wrong")
        print(err.msg)

# When using a cursor, the cursor itself has to be closed too. 
cursor.close()       
cnction.close()

cxn = mysql.connector.connect(user = USER, password = PASSWORD, host = HOST, database = DATABASE)
cursor = cxn.cursor()
