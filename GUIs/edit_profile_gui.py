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
        self.oldHandle = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.oldHandle)
        self.entry.grid(column=0,row=1,columnspan=2,stick='EW')
        
        self.password = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.password)
        self.entry.grid(column=0,row=3,columnspan=2,stick='EW')

        self.city = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.city)
        self.entry.grid(column=0,row=5,columnspan=2,stick='EW')

        self.handle = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.handle)
        self.entry.grid(column=0,row=7,columnspan=2,stick='EW')

        self.hidden_info = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.hidden_info)
        self.entry.grid(column=0,row=9,columnspan=2,stick='EW')

        self.hidden_profile = tkinter.StringVar()
        self.entry = tkinter.Entry(self,textvariable=self.hidden_profile)
        self.entry.grid(column=0,row=11,columnspan=2,stick='EW')



        #LABELS
        self.labelOldHandle = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelOldHandle,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=0,columnspan=2,sticky='EW')
        self.labelOldHandle.set(u"Enter your current handle")
        
        self.labelPassword = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelPassword,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=2,columnspan=2,sticky='EW')
        self.labelPassword.set(u"If you want a new password enter here:")

        self.labelCity = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelCity,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=4,columnspan=2,sticky='EW')
        self.labelCity.set(u"If you want to change you're preferred city enter here:")

        self.labelHandle = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelHandle,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=6,columnspan=2,sticky='EW')
        self.labelHandle.set(u"If you want a new handle enter here:")

        self.labelHiddenInfo = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelHiddenInfo,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=8,columnspan=2,sticky='EW')
        self.labelHiddenInfo.set(u"Would you like to hide you personal info?")

        self.labelHiddenProfile = tkinter.StringVar()
        label = tkinter.Label(self,textvariable=self.labelHiddenProfile,
                              anchor = "w",fg="white",bg="blue")
        label.grid(column=0,row=10,columnspan=2,sticky='EW')
        self.labelHiddenProfile.set(u"Would you like to hide your profile?")

        #BUTTON
        '''
        self.button2 = tkinter.Button(self,text=u"Upload Profile Picture",
                                command=self.OnButtonClickAlt)
        self.button2.grid(column=0,row=22,columnspan=2)

        '''

        button = tkinter.Button(self,text=u"Update Profile",
                                command=self.OnButtonClick)
        button.grid(column=0,row=12,columnspan=2)
        
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
        locationCur = cnx.cursor()
        handleCur = cnx.cursor()
            
        user_city = self.city.get().upper()
        info = self.hidden_info.get().upper()
        hide_profile = self.hidden_profile.get().upper()

        if info == 'YES':
            first_check = 1
        if info == 'NO':
            first_check = 0
        if hide_profile == 'YES':
            second_check = 1
        if hide_profile == 'NO':
            second_check = 0

        error = 0

        if self.password.get() == '':
            password = None
        elif len(self.password.get())>50:
            print("Please shorten your password.")
            error = 1
        else: password = self.password.get()

        if user_city == '':
            user_city = None
        elif len(user_city)>50:
            print("Your city is too long, please shorten it.")
            error = 1

        if info == '':
            first_check = 0
        if hide_profile == '':
            second_check = 0
        elif (info != 'YES' and info != 'NO') or (hide_profile != 'YES' and hide_profile != 'NO'):
            print("Please enter yes or no for the hidden info fields.")
            error = 1

        if self.handle.get() == '':
            handle = None
        elif len(self.handle.get())>50:
            print("Please shorten your handle.")
            error = 1
        else:
            handle = self.handle.get()
        
        handleCur.execute("SELECT handle from profile")
        hanRows = handleCur.fetchall()
        han_exists = 0
        for q in hanRows:
            if self.oldHandle.get() == f"{q[0]}":
                han_exists = 1
        locationCur.execute("SELECT city_name, country_name from location")
        rows = locationCur.fetchall()
        city_exists = 0
        for c in rows:
            if user_city == f"{c[0]}":
                city_exists = 1
        if han_exists == 0:
            print("That isn't your proper old handle.")
        elif city_exists == 0 and user_city != None:
            print("Please enter Boston, London, Stockholm, Wellington or Chicago for the city.")
        elif error == 1:
            print("Please fix suggested fields")
        else:
             userCur.callproc('EditProfile', (self.password.get(),
                                                user_city, first_check,
                                                second_check, self.oldHandle.get(),
                                                self.handle.get()))
             userCur.execute("SELECT first_name, dob from user")
             rows = userCur.fetchall()
             for r in rows:
                 print(f" NAME = {r[0]} DOB = {r[1]}")

        userCur.close()
        locationCur.close()



if __name__ == "__main__":
    cnx = mysql.connector.connect(
        user='project_user',
        database='run_circle'
        )
    print("connected")


    
    app = simpleapp_tk(None)
    app.title('Edit Profile')
    app.mainloop()

    
    cnx.close()
