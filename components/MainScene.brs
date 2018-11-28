' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********  

sub init()
    m.top.SetFocus(true)
    m.userInput = m.top.findNode("userInput")
    m.myUserName = m.top.findNode("userName")
    m.myUserName.observeField("buttonSelected","onInputUserName")
    m.myUserName.setFocus(true)
    m.myUserPass = m.top.findNode("userPassword")
    m.myUserPass.observeField("buttonSelected","onInputUserPass")
    m.loginBtn = m.top.findNode("userLogin")
    m.loginBtn.observeField("buttonSelected","onLoginButton")
    m.myKeyboardValue = m.top.findNode("myKeyboardValue")
    m.myKeyboardValue.visible = false
    m.field = ""
End sub

sub onInputUserName()
    m.field = "userName"
    m.myKeyboardValue.text = ""
    m.myKeyboardValue.visible = true
    m.myKeyboardValue.setFocus(true)
End sub

sub onInputUserPass()
    m.field = "userPass"
    m.myKeyboardValue.text = ""
    m.myKeyboardValue.visible = true
    m.myKeyboardValue.setFocus(true)
end sub

sub onLoginButton()
    print "Login Button Clicked"
     
    m.details = m.top.createChild("userDetails")
    m.details.visible = true
    m.details.setFocus(true)  
    m.details.userNameLabel = m.myUserName.text
End sub


function onKeyEvent(key as String, press as Boolean) as Boolean
    
    print key
    if press 
        if key = "down"  
            if m.myUserName.hasFocus() 
                print "focus on user name"
                m.myUserPass.setFocus(true)               
            else if m.myUserPass.hasFocus() 
                print "focus on user password"
                m.loginBtn.setFocus(true)
            end if            
       
                
        else if key = "up"            
            if m.loginBtn.hasFocus() 
                print "focus on user password"
                m.myUserPass.setFocus(true)               
            else if m.myUserPass.hasFocus()
                print "focus on user name" 
                m.myUserName.setFocus(true)
            end if                                
           
        else if key = "play"
        print "key - play"
            if m.field = "userName"
                print "entering user name"
                m.myUserName.text = m.myKeyboardValue.text
                m.myKeyboardValue.visible = false
                m.myUserName.setFocus(true)
            
            else if m.field = "userPass" 
                print "entering user pass"
                m.myUserPass.text = m.myKeyboardValue.text
                m.myKeyboardValue.visible = false
                m.myUserPass.setFocus(true)            
            end if
             
       else if key = "back"
        m.myUserName.setFocus(true)           
       end if
       
    end if
    return true
end function