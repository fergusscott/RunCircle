import mysql.connector
from mysql.connector import MySQLConnection, Error


mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="Tennis007))&",
    database="run_circle"
)


def addFriend(prof1_id, prof2_id):
    mycursor = mydb.cursor()

# this calls the stored proc to SQL and inserts the data given.
    try:
        result_args = mycursor.callproc('addFriend', (prof1_id, prof2_id))
        print(result_args)

# throws an error if there is one
    except Error as e:
        print("Oops, looks like there's a problem: {}".format(e))

    finally:
        mycursor.close()

# main function to call the addfriend function and commits the result.
if __name__ == '__main__':
    addFriend(10,13)
    mydb.commit()














'''
mycursor = mydb.cursor()
args = [50,60]
mycursor.callproc('addFriend', args)
mycursor.execute('select * from friend_connections')
myresult = mycursor.fetchall()
for row in myresult:
    print(row)
mydb.commit()

'''

'''
    try:
        db_config = read_db_config()
        conn = MySQLConnection(**db_config)
        cursor = conn.cursor()

        args = ['1236400967773', 0]
        result_args = cursor.callproc('find_by_isbn', args)

        print(result_args[1])

    except Error as e:
        print(e)

    finally:
        cursor.close()
        conn.close()


if __name__ == '__main__':
    call_find_by_isbn()
'''