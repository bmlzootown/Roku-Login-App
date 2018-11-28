sub init()
    m.top.setFocus(true)
    m.bgRectangle = m.top.findNode("bgRectangle")
    m.userOutput = m.top.findNode("userOutput")
    m.userName = m.top.findNode("userName")
    m.userPoster = m.top.findNode("userPoster")
    m.userPoster.visible = false
    m.seePosterButton = m.top.findNode("seePoster")
    m.seePosterButton.observeField("buttonSelected","onClickSeePoster")
End sub

sub onDisplayUserName()
?"In Display name"
    m.seePosterButton.setFocus(true)
    m.userName.text = m.top.userNameLabel
End sub

sub onClickSeePoster()
    ?"seeing poster"
    m.userPoster.visible = true
End sub


function onKeyEvent(key as String, press as Boolean) as Boolean  
    
    if press 
        if key = "back"
            m.top.visible = false     
        end if         
    end if
    
end function