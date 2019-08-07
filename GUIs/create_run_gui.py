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
        self.city = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.city)
        self.entry.grid(column=0,row=1,columnspan=2,stick='EW')

        self.distance = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.distance)
        self.entry.grid(column=0,row=3,columnspan=2,stick='EW')

        self.duration = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.duration)
        self.entry.grid(column=0,row=5,columnspan=2,stick='EW')

        self.pace = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.pace)
        self.entry.grid(column=0,row=7,columnspan=2,stick='EW')
    
        self.date = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.date)
        self.entry.grid(column=0,row=9,columnspan=2,stick='EW')

        self.elevation = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.elevation)
        self.entry.grid(column=0,row=11,columnspan=2,stick='EW')

        self.circle = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.circle)
        self.entry.grid(column=0,row=13,columnspan=2,stick='EW')

        self.handle = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.handle)
        self.entry.grid(column=0,row=15,columnspan=2,stick='EW')

        #LABELS
        self.labelCity = tkinter.StringVar()
        label = tkinter.Label(self,text=u"What city did you run in?",
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=0,columnspan=2,sticky='EW')
                
        self.labelDistance = tkinter.StringVar()
        label = tkinter.Label(self,text=u"Distance in Miles",
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=2,columnspan=2,sticky='EW')

        self.labelDuration = tkinter.StringVar()
        label = tkinter.Label(self,text=u"Duration hh:mm:ss",
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=4,columnspan=2,sticky='EW')

        self.labelPace = tkinter.StringVar()
        label = tkinter.Label(self,text=u"Pace per Mile (Duration/Distance)",
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=6,columnspan=2,sticky='EW')
            
        self.labelDate = tkinter.StringVar()
        label = tkinter.Label(self,text=u"Scheduled Date of Run YYYY:MM:DD",
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=8,columnspan=2,sticky='EW')

        self.labelElevation = tkinter.StringVar()
        label = tkinter.Label(self,text=u"Elevation of the Run",
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=10,columnspan=2,sticky='EW')

        self.labelCircle = tkinter.StringVar()
        label = tkinter.Label(self,text=u"Enter Circle Name (Optional)",
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=12,columnspan=2,sticky='EW')

        self.labelHandle = tkinter.StringVar()
        label = tkinter.Label(self,text=u"Enter User Handle",
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=14,columnspan=2,sticky='EW')


        #BUTTON   
        button = tkinter.Button(self,text=u"Insert Run",
                                command=self.OnButtonClick)
        button.grid(column=0,row=16,columnspan=2)
        

        self.grid_columnconfigure(0,weight=1)
        self.resizable(True,False)
        self.update()
        self.geometry(self.geometry())


    def OnButtonClick(self):
        cnx = mysql.connector.connect(
        user='project_user',
        database='run_circle'
        )
        userCur = cnx.cursor()
        locationCur = cnx.cursor()

        user_city = self.city.get().upper()

        locationCur.execute("SELECT city_name from location")
        rows = locationCur.fetchall()
        city_exists = 0
        for c in rows:
            if user_city == f"{c[0]}":
                city_exists = 1

        if self.circle.get() == '':
            circle = -1
        else:
            circle = self.circle.get()

        userCur.callproc('InsertRun', (self.handle.get(), self.duration.get(),
                        self.distance.get(), self.pace.get(),
                        circle, self.elevation.get(),user_city,
                        1, self.date.get()))

        userCur.execute("SELECT handle, pace_per_mile from profile")
        rows = userCur.fetchall()
        for r in rows:
            print(f" ID = {r[0]} NAME = {r[1]}")

        userCur.close

if __name__ == "__main__":
    cnx = mysql.connector.connect(
        user='project_user',
        database='run_circle'
        )
    print("connected")

    
    app = simpleapp_tk(None)
    app.title('my application')
    app.mainloop()

    
    cnx.close()





