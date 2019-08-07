#!/usr/bin/python
import create_run_gui


import tkinter
import mysql.connector

class simpleapp_tk(tkinter.Tk):
    def __init__(self, parent):
        tkinter.Tk.__init__(self,parent)
        self.parent = parent
        self.initialize()
        

    def initialize(self):
        self.grid()
                
        #BUTTON   
        button = tkinter.Button(self,text=u"Insert Run",
                                command=self.OnButtonClick)
        button.grid(column=0,row=0,columnspan=2)

        button = tkinter.Button(self,text=u"Create Circle",
                                command=self.OnButtonClick2)
        button.grid(column=0,row=1,columnspan=2)
        
        

        self.grid_columnconfigure(0,weight=1)
        self.resizable(True,False)
        self.update()
        self.geometry(self.geometry())



    def OnButtonClick(self):
        cnx = mysql.connector.connect(
        user='project_user',
        database='run_circle'
        )
        passCur = cnx.cursor()

        create_run_gui.simpleapp_tk(self.parent)

        passCur.close()

    def OnButtonClick2(self):
        cnx = mysql.connector.connect(
        user='project_user',
        database='run_circle'
        )
        passCur = cnx.cursor()

        create_run_gui.simpleapp_tk(self.parent)

        passCur.close()



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
