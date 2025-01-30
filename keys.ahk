#Requires AutoHotkey v2.0

!n:: Run "notepad"
!b:: Run "msEdge"
!c:: Run "C:\Users\saidm\AppData\Local\Programs\Microsoft VS Code\Code.exe"
^!t:: Run A_ComSpec " /k cd /d %USERPROFILE%"
^!q:: Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\QMK MSYS.lnk"

/*---------------------------------------------------Browser Shortcut----------------------------------------------------------*/
AppsKey & 1:: Run "explorer"
AppsKey & 2:: Run "msEdge"
AppsKey & 3:: Run "C:\Users\saidm\AppData\Local\Programs\Microsoft VS Code\Code.exe"
AppsKey & 4:: Run "C:\Users\saidm\AppData\Local\Autodesk\webdeploy\production\6a0c9611291d45bb9226980209917c3d\FusionLauncher.exe"
AppsKey & 5:: Run "C:\Program Files\Prusa3D\PrusaSlicer\prusa-slicer.exe"
AppsKey & 6:: Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\QMK MSYS.lnk"
AppsKey & 7:: Run "notepad"
AppsKey & 8:: Run "notepad"
AppsKey & 9:: Run "notepad"
AppsKey & 0:: Run "notepad"
/*---------------------------------------------------Browser Shortcut----------------------------------------------------------*/
^!s:: Run "msEdge.exe https://educaciodigital.cat/iesalmata/moodle/my/courses.php https://docs.google.com/document/u/1/?tgif=d"

#HotIf WinActive("ahk_exe msedge.exe")
^!1:: Run "https://www.google.com/"
^!2:: Run "https://docs.google.com/document/u/1/"
^!3:: Run "https://docs.google.com/spreadsheets/u/1/?tgif=d"
^!4:: Run "https://drive.google.com/drive/u/1/my-drive"
^!5:: Run "https://www.youtube.com/"
^!6:: Run "https://drive.google.com/drive/u/1/home"
^!7:: Run "https://drive.google.com/drive/u/1/home"
^!8:: Run "https://drive.google.com/drive/u/1/home"
^!9:: Run "https://drive.google.com/drive/u/1/home"
^!0:: Run "https://drive.google.com/drive/u/1/home"
#HotIf

/*-----------------------------------------------------File Explorer------------------------------------------------------------*/
#!a:: Run "C:\Users\saidm\Archive"
#!c:: Run "C:\Users\saidm\Pictures\Screenshots"
#!d:: Run "C:\Users\saidm\Downloads"
#!p:: Run "C:\Users\saidm\Pictures"

/*-------------------------------------------------------------------------------------------*/

; Toggle Hidden Files in File Explorer
^F2:: CheckActiveWindow()
CheckActiveWindow() {
    global
    ID := WinExist("A")
    win_Class := WinGetClass("ahk_id " ID)
    WClasses := "CabinetWClass ExploreWClass"
    if InStr(WClasses, win_Class)
        Toggle_HiddenFiles_Display()
}

Toggle_HiddenFiles_Display() {
    global
    RootKey := "HKEY_CURRENT_USER"
    SubKey := "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    HiddenFiles_Status := RegRead(RootKey "\" SubKey, "Hidden")
    if (HiddenFiles_Status = 2)
        RegWrite(1, "REG_DWORD", RootKey "\" SubKey, "Hidden")
    else
        RegWrite(2, "REG_DWORD", RootKey "\" SubKey, "Hidden")
    PostMessage(0x111, 41504, , , "ahk_id " ID)
}

/*---------------------------------------------------Symbols Shortcut----------------------------------------------------------*/
; :*?B0:"::{"}{Left}
; :*?B0:(::{)}{Left}
; :*?B0:[::{]}{Left}
; :*?B0:{::{}}{Left}

; :X*:{::send '{{}{}}{Left}'
; :X*:(::send '(){Left}'
; :X*:"::send '""{Left}'
; :X*:[::send '[]{Left}'

/*------------------------------------------------------Text Editor------------------------------------------------------------*/
#HotIf !WinActive('ahk_exe Code.exe')
^!l:: Send '{Home}{Shift Down}{End}{Shift Up}'
^d:: {
    SendInput '{Ctrl Down}{Left}{Ctrl Up}'
    SendInput '{Ctrl Down}{Shift Down}{Right}{Shift Up}{Ctrl Up}'
    SendInput '{Shift Down}{Left}{Shift Up}'
}
#HotIf
^+Delete:: Send '{Home}{Shift Down}{End}{Shift Up}{Delete}'
^+Backspace:: Send '{Home}{Shift Down}{End}{Shift Up}{Delete}'
+Delete:: Send '{Ctrl Down}{Right}{Ctrl Up}{Ctrl Down}{Shift Down}{Left}{Ctrl Up}{Shift Down}{Delete}'
+Backspace:: Send '{Ctrl Down}{Left}{Ctrl Up}{Ctrl Down}{Shift Down}{Right}{Ctrl Up}{Shift Down}{Delete}'

::]FullDate:: {
    Send A_DDD " " A_DD " " A_MMM " " A_YYYY "."
}

::]ND:: {
    Send A_DD "/" A_MM "/" A_YYYY
}

::]CD:: {
    Send A_DDDD " "
}

::]Time:: {
    Send A_Hour ":" A_Min ":" A_Sec
}

/*------------------------------------------------------HotStrings-------------------------------------------------------------*/

;Read More about HotStrings
::btw::by the way
::]email::saidmrini2019@gmail.com
::dont::don't
::isnt::isn't
::wasnt::wasn't
::werent::weren't
::wouldnt::wouldn't
::shouldnt::shouldn't
::couldnt::couldn't
::didnt::didn't
::doesnt::doesn't
::hasnt::hasn't
::havent::haven't
::hadnt::hadn't
::cant::can't
::couldve::could've
::shouldve::should've
::wouldve::would've
::didnt::didn't
::hasnt::hasn't

/*--------------------------------------------------KeyBoard Remaping----------------------------------------------------------*/

+CapsLock::CapsLock
CapsLock:: send "{Alt Down}{Tab}{Alt Up}"
^CapsLock:: send "#+s"

^+Up:: send "{Up 5}"
^+Down:: send "{Down 5}"

; Custom scroll behavior with touchpad detection
+WheelDown:: {
    lastScrollTime := 0
    scrollThreshold := 100

    currentTime := A_TickCount
    if (currentTime - lastScrollTime < scrollThreshold) {
        Send "{WheelDown}"
    } else {
        Send "{WheelDown 8}"
    }
    lastScrollTime := currentTime
}

+WheelUp:: {
    lastScrollTime := 0
    scrollThreshold := 100

    currentTime := A_TickCount
    if (currentTime - lastScrollTime < scrollThreshold) {
        Send "{WheelUp}"
    } else {
        Send "{WheelUp 8}"
    }
    lastScrollTime := currentTime
}

+WheelLeft:: Send "{WheelLeft 8}"
+WheelRight:: Send "{WheelRight 8}"

^!WheelUp::Volume_Up
^!WheelDown::Volume_Down
^!MButton::Volume_Mute


/*---------------------------------------------------AHK Ctr Shortcut----------------------------------------------------------*/

^!\:: Suspend
^!=:: Reload
^!-:: Edit

/*------------------------------------------------------Garbage Code-----------------------------------------------------------*/

/*)
to ckeck if an input field is selected/active
n:: {
    CaretGetPos(&x, &y)
    if (x != "" && y != "") {
        MsgBox("TYPE AWAY! TEXT WILL BE INSERTED!")
    } else {
        MsgBox("No input field is selected/active.")
    }
}
*/

/*
^!u::{
    Run A_ComSpec " /k ubuntu"
}

^!l::{
    Run A_ComSpec " /k kali"
}

^!k::{
    Run A_ComSpec " /k kali"
    WinWaitActive "ahk_exe WindowsTerminal.exe"
    Send "kex --win -s {enter}"
}
*/

/*----------------------------------------------------------Tools--------------------------------------------------------------*/

; Renaming a bunch of files
#HotIf WinActive("ahk_exe explorer.exe")
^!+r:: {
    Send("^c")
    InputedfileName := InputBox("type file name").value
    counter := 0
    loop parse A_Clipboard, "`n", "`r" {
        counter++
        SplitPath A_LoopField, , &folder, &fileExtension
        newFullFilePath := folder '\' InputedfileName ' ' counter '.' fileExtension
        FileMove A_LoopField, newFullFilePath
    }
}
#HotIf

; Adding a preffix to the selected file names
#HotIf WinActive("ahk_exe explorer.exe")
^!+p:: {
    Send("^c")
    inputedPrefix := InputBox("Enter Preffix").value
    loop parse A_Clipboard, "`n", "`r" {
        SplitPath A_LoopField, &fileName, &folder
        newFullFilePath := folder '\' inputedPrefix ' ' fileName
        FileMove A_LoopField, newFullFilePath
    }
}
#HotIf

; Adding a suffix to the selected file names
#HotIf WinActive("ahk_exe explorer.exe")
^!+s:: {
    Send("^c")
    inputedSuffix := InputBox("type suffix").value
    loop parse A_Clipboard, "`n", "`r" {
        SplitPath A_LoopField, , &folder, &fileExtension, &fileNameNoExtension
        newFullFilePath := folder '\' fileNameNoExtension ' ' inputedSuffix '.' fileExtension
        FileMove A_LoopField, newFullFilePath
    }
}
#HotIf


/*-------------------------------------------------------------------------------------------*/
; Search for the selected text on google
^!g:: {
    A_Clipboard := ""
    Send("^c")
    ClipWait
    Run("http://www.google.com/search?q=" A_Clipboard)
}

;Paste the copied link or text in a new tab in the browser
^!#0:: {
    Send("^c")
    ClipWait
    If WinExist("ahk_class Chrome_WidgetWin_1") {
        WinActivate
        Send("^t")
    } else {
        Run "msEdge.exe"
        WinWaitActive "New tab - Microsoft Edge"
    }
    Send "^v"
    Send "{Enter}"
}

/*-------------------------------------------------------------------------------------------*/

; Download Utility
^+d:: {
    ; Clear the clipboard and copy the selected text (URL) to the clipboard
    A_Clipboard := "", Send("^c"), ClipWait()
    url := A_Clipboard

    ; Check if the copied text is a valid URL
    if !RegExMatch(url, "^(https?:\/\/|www\.)") {
        MsgBox("Invalid URL", "Error", "16")
        return
    }

    try {
        ; Extract the file name from the URL or generate a timestamped file name if extraction fails
        fileName := RegExReplace(url, ".*\/([^/?]+).*", "$1")
        fileName := fileName = url ? FormatTime(, "yyyyMMdd-HHmmss") ".file" : StrReplace(fileName, "%20", " ")

        ; Get the default download path from the registry
        downloadPath := RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders", "{374DE290-123F-4565-9164-39C4925E467B}")

        ; Set the full path for the downloaded file
        fullPath := (downloadPath ?? A_MyDocuments "\Downloads") "\" fileName

        ; Ensure the file name is unique by appending an index if a file with the same name already exists
        while FileExist(fullPath) {
            SplitPath(fileName, , , &ext, &name)
            fullPath := downloadPath "\" name "_" A_Index "." ext
        }

        ; Download the file from the URL to the specified path
        Download(url, fullPath)

        ; Notify the user of the status of download
        if (MsgBox("Downloaded as: " fileName "`nTo: " downloadPath "`n`n" "Open Download folder?", "Success", "64 0x4") = "Yes")
            Run("explorer.exe `"" downloadPath "`"")
    } catch as err {
        MsgBox("Download failed: " err.message, "Error", "16")
    }
}

/*-------------------------------------------------------------------------------------------*/

#Hotif WinActive("ahk_exe Fusion360.exe")
; ^!0:: {
;     CoordMode "Pixel"
;     MouseGetPos(&Startx, &StartY)
;     if ImageSearch(&ImageX, &ImageY, 0, 0, A_ScreenWidth, A_ScreenHeight, "C:\Users\saidm\Documents\AutoHotkey\Pics\NewComp.png") {
;         MouseClick "Left", ImageX + 15, ImageY
;         MouseMove Startx, StartY
;     }
;     else
;         MsgBox "image was not found in the specified region"
; }

^+z:: Send "^y"

; XButton2:: {
;     Send "{Shift down}{MButton down}"
;     KeyWait "XButton2"
;     Send "{Shift up}{MButton up}"
; }

XButton2:: {
    Send("{Shift down}{MButton down}")
    while GetKeyState("XButton2", "P") {
        Sleep(10)
    }
    Send("{Shift up}{MButton up}")
}

XButton1:: Send "{ESC}"

#HotIf


/*-----------------------------------------Auto Wrap--------------------------------------------------*/
GroupAdd "MyGroup", "ahk_exe Illustrator.exe"
GroupAdd "MyGroup", "ahk_exe Code.exe"

#HotIf !WinActive("ahk_group MyGroup")
; Function to check if text is selected
IsTextSelected() {
    ; Save the current clipboard content
    ClipSaved := ClipboardAll()
    A_Clipboard := "" ; Clear the clipboard

    ; Send Ctrl+C to copy the selected text
    Send("^c")
    ClipWait(0.1) ; Wait for the clipboard to update

    ; Check if the clipboard contains any text
    if (A_Clipboard != "") {
        ; Restore the original clipboard content
        A_Clipboard := ClipSaved
        return true
    } else {
        ; Restore the original clipboard content
        A_Clipboard := ClipSaved
        return false
    }
}

; ^f:: {
;     ; Example usage
;     if IsTextSelected() {
;         MsgBox "Text is selected"
;     } else {
;         MsgBox "No text is selected"
;     }
; }

:X*:":: {
    ; Example usage
    if IsTextSelected() {
        SendInput '^x'
        SendInput '{Raw}""'
        SendInput '{Left}'
        SendInput '^v'
        SendInput '{Right}'
    } else {
        SendInput '{Raw}""'
        SendInput '{Left}'
    }
}

:X*:':: {
    ; Example usage
    if IsTextSelected() {
        SendInput "^x"
        ClipWait
        SendInput "{Raw}''"
        SendInput "{Left}"
        SendInput "^v"
        SendInput "{Right}"
    } else {
        SendInput "{Raw}''"
        SendInput "{Left}"
    }
}

:X*:{:: {
    ; Example usage
    if IsTextSelected() {
        SendInput "^x"
        ClipWait
        SendInput "{Raw}{}"
        SendInput "{Left}"
        SendInput "^v"
        SendInput "{Right}"
    } else {
        SendInput "{Raw}{}"
        SendInput "{Left}"
    }
}

:X*:(:: {
    ; Example usage
    if IsTextSelected() {
        SendInput "^x"
        ClipWait
        SendInput "{Raw}()"
        SendInput "{Left}"
        SendInput "^v"
        SendInput "{Right}"
    } else {
        SendInput "{Raw}()"
        SendInput "{Left}"
    }
}

:X*:[:: {
    ; Example usage
    if IsTextSelected() {
        SendInput "^x"
        ClipWait
        SendInput "{Raw}[]"
        SendInput "{Left}"
        SendInput "^v"
        SendInput "{Right}"
    } else {
        SendInput "{Raw}[]"
        SendInput "{Left}"
    }
}

:X*:<:: {
    ; Example usage
    if IsTextSelected() {
        SendInput "^x"
        SendInput "{Raw}<>"
        SendInput "{Left}"
        SendInput "^v"
        SendInput "{Right}"
    } else {
        SendInput "{Raw}<>"
        SendInput "{Left}"
    }
}

#HotIf
/*-------------------------------------------------------------------------------------------*/

#HotIf WinActive("ahk_exe explorer.exe") ; Only works when File Explorer is active
; open the current folder in VS Code
+!C:: {
    Send("^l")
    Sleep 100
    Send("cmd{Enter}")
    WinWaitActive "ahk_exe WindowsTerminal.exe"
    Send "Code .{Enter}"
    Sleep 1000
    if WinExist("ahk_exe WindowsTerminal.exe") {
        WinClose ; Use the window found by WinExist.
    }
}
#HotIf

; ctrl+alt+shift+t: open powershell at current folder location in file explorer
#HotIf WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass")
SendMode("Input")
^+!t:: {
    try {
        WinHWND := WinActive()
        for win in ComObject("Shell.Application").Windows {
            if (win.HWND = WinHWND) {
                dir := SubStr(win.LocationURL, 9)
                dir := RegExReplace(dir, "%20", " ")
                break
            }
        }
        if (dir) {
            Run("cmd", dir)
        } else {
            MsgBox("Failed to retrieve directory. Opening PowerShell in the desktop directory.")
            Run("cmd", A_Desktop)
        }
    } catch error {
        MsgBox("An error occurred: " . error.Message)
        Run("cmd", A_Desktop)
    }
}