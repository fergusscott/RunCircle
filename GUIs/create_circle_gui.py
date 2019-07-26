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
        self.circle_name = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.circle_name)
        self.entry.grid(column=0,row=0,columnspan=2,stick='EW')

        #LABELS
        self.labelCircle = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelCircle,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=1,columnspan=2,sticky='EW')
        self.labelCircle.set(u"Circle Name")
                
        #BUTTON   
        button = tkinter.Button(self,text=u"Create Circle",
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





