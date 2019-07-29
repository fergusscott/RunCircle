import tkinter, tkinter.filedialog
import mysql.connector
from PIL import Image


class simpleapp_tk(tkinter.Tk):
    def __init__(self, parent):
        tkinter.Tk.__init__(self,parent)
        self.parent = parent
        self.initialize()

    def initialize(self):
        self.grid()

        #FIELDS
        self.first_name = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.first_name)
        self.entry.grid(column=0,row=1,columnspan=2,stick='EW')

        self.last_name = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.last_name)
        self.entry.grid(column=0,row=3,columnspan=2,stick='EW')

        self.email = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.email)
        self.entry.grid(column=0,row=5,columnspan=2,stick='EW')

        self.password = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.password)
        self.entry.grid(column=0,row=7,columnspan=2,stick='EW')

        self.phone = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.phone)
        self.entry.grid(column=0,row=9,columnspan=2,stick='EW')
        self.phone.set(u"OPTIONAL")

        self.dob = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.dob)
        self.entry.grid(column=0,row=11,columnspan=2,stick='EW')

        self.gender = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.gender)
        self.entry.grid(column=0,row=13,columnspan=2,stick='EW')

        self.location = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.location)
        self.entry.grid(column=0,row=15,columnspan=2,stick='EW')

        self.handle = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.handle)
        self.entry.grid(column=0,row=17,columnspan=2,stick='EW')

        self.hidden_info = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.hidden_info)
        self.entry.grid(column=0,row=19,columnspan=2,stick='EW')

        self.hidden_profile = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.hidden_profile)
        self.entry.grid(column=0,row=21,columnspan=2,stick='EW')



        #LABELS
        self.labelFirst = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelFirst,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=0,columnspan=2,sticky='EW')
        self.labelFirst.set(u"First Name")
                
        self.labelLast = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelLast,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=2,columnspan=2,sticky='EW')
        self.labelLast.set(u"Last Name")
                
        self.labelEmail = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelEmail,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=4,columnspan=2,sticky='EW')
        self.labelEmail.set(u"Email")

        self.labelPassword = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelPassword,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=6,columnspan=2,sticky='EW')
        self.labelPassword.set(u"Password")
                
        self.labelPhone = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelPhone,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=8,columnspan=2,sticky='EW')
        self.labelPhone.set(u"Phone Number")
                
        self.labelDOB = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelDOB,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=10,columnspan=2,sticky='EW')
        self.labelDOB.set(u"Date of Birth")
 
        self.labelGender = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelGender,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=12,columnspan=2,sticky='EW')
        self.labelGender.set(u"Gender")

        self.labelLocation = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelLocation,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=14,columnspan=2,sticky='EW')
        self.labelLocation.set(u"Location")

        self.labelHandle = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelHandle,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=16,columnspan=2,sticky='EW')
        self.labelHandle.set(u"Handle")

        self.labelHiddenInfo = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelHiddenInfo,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=18,columnspan=2,sticky='EW')
        self.labelHiddenInfo.set(u"Would you like to hide you personal info?")

        self.labelHiddenProfile = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelHiddenProfile,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=20,columnspan=2,sticky='EW')
        self.labelHiddenProfile.set(u"Would you like to hide your profile?")

        #BUTTON
        '''
        self.button2 = tkinter.Button(self,text=u"Upload Profile Picture",
                                command=self.OnButtonClickAlt)
        self.button2.grid(column=0,row=22,columnspan=2)

        '''

        button = tkinter.Button(self,text=u"Create User",
                                command=self.OnButtonClick)
        button.grid(column=0,row=23,columnspan=2)
        
        self.grid_columnconfigure(0,weight=1)
        self.resizable(True,False)
        self.update()
        self.geometry(self.geometry())
        
    '''

    def OnButtonClickAlt(self):
        with tkinter.filedialog.askopenfile(
            parent=self,mode='r',title='Choose a file'
            ) as self.pic:
            self.binaryData = self.pic.encode('utf-8')
            self.final = self.binaryData.read()
            self.pic.close()
    '''

    def OnButtonClick(self):
        userCur = cnx.cursor()
        passCur = cnx.cursor()

        
        userCur.callproc('CreateAccount', (self.first_name.get(), self.last_name.get(),
                                       self.email.get(), self.password.get(),
                                       self.phone.get(), self.dob.get(),
                                       self.gender.get(), self.location.get(),
                                       self.hidden_info.get(), self.hidden_profile.get(),
                                       self.handle.get()))


        userCur.execute("SELECT first_name, dob from user")
        rows = userCur.fetchall()
        for r in rows:
            print(f" NAME = {r[0]} DOB = {r[1]}")

        cnx.close()



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




