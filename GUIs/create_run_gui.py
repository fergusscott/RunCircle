import tkinter
import mysql.connector

class simpleapp_tk(tkinter.Tk):
    def __init__(self, parent):
        tkinter.Tk.__init__(self,parent)
        self.parent = parent
        self.initialize()

    def initialize(self):
        self.grid()

        #FIELDS
        self.location = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.location)
        self.entry.grid(column=0,row=0,columnspan=2,stick='EW')

        self.distance = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.distance)
        self.entry.grid(column=0,row=2,columnspan=2,stick='EW')

        self.date = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.date)
        self.entry.grid(column=0,row=4,columnspan=2,stick='EW')

        #LABELS
        self.labelLocation = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelLocation,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=1,columnspan=2,sticky='EW')
        self.labelLocation.set(u"Where would you like to run?")
                
        self.labelDistance = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelDistance,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=3,columnspan=2,sticky='EW')
        self.labelDistance.set(u"Distance")
                
        self.labelDate = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelDate,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=5,columnspan=2,sticky='EW')
        self.labelDate.set(u"Date of Run")



        #BUTTON   
        button = tkinter.Button(self,text=u"Create User",
                                command=self.OnButtonClick)
        button.grid(column=0,row=16,columnspan=2)
        

        self.grid_columnconfigure(0,weight=1)
        self.resizable(True,False)
        self.update()
        self.geometry(self.geometry())


    def OnButtonClick(self):
        self.entry.focus_set()
        self.entry.selection_range(0, tkinter.END)


if __name__ == "__main__":
    cnx = mysql.connector.connect(
        user='project_user',
        database='run_circle'
        )
    print("connected")

    userCur = cnx.cursor()
    passCur = cnx.cursor()

    userCur.execute("SELECT user_id, first_name from user")
    rows = userCur.fetchall()
    for r in rows:
        print(f" ID = {r[0]} NAME = {r[3]}")
    
    app = simpleapp_tk(None)
    app.title('my application')
    app.mainloop()

    
    cnx.close()





