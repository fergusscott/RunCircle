#!/usr/bin/python
import menu_gui

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
        self.email = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.email)
        self.entry.grid(column=0,row=1,columnspan=2,stick='EW')

        self.password = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.password)
        self.entry.grid(column=0,row=3,columnspan=2,stick='EW')

        #LABELS             
        self.labelEmail = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelEmail,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=0,columnspan=2,sticky='EW')
        self.labelEmail.set(u"Email")

        self.labelPassword = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelPassword,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=2,columnspan=2,sticky='EW')
        self.labelPassword.set(u"Password")
                
        #BUTTON   
        button = tkinter.Button(self,text=u"Login",
                                command=self.OnButtonClick)
        button.grid(column=0,row=16,columnspan=2)
        

        self.grid_columnconfigure(0,weight=1)
        self.resizable(True,False)
        self.update()
        self.geometry(self.geometry())

    def OnButtonClick(self):
        userCur = cnx.cursor()
        passCur = cnx.cursor()

        query = ("select handle, avg_duration, pace_per_mile, avg_distance_miles, runs \
from profile join account using (user_id) \
where email = %s and password = %s")

        userCur.execute(query, (self.email.get(), self.password.get()))

        rows = userCur.fetchall()
        me = 0
        for r in rows:
            me = f"{r[0]}"
            print(f" HANDLE = {r[0]} AVERAGE DURATION = {r[1]} PACE = {r[2]} AVERAGE DISTANCE = {r[3]} RUNS = {r[4]}")
        print("use: ", me)
        if me == "fergoscotty":
            menu_gui.simpleapp_tk(self.parent)
        self.destroy
        
        userCur.close()

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





