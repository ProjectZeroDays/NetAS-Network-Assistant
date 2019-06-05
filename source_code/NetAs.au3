#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\Desktop\icons8-networking-manager-64.ico
#AutoIt3Wrapper_Outfile=NetAs.Exe
#AutoIt3Wrapper_Res_Comment=A Gui that you can run cmd commands, build with AutoIT
#AutoIt3Wrapper_Res_Fileversion=v1.1
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <AutoItConstants.au3>
#include <GuiEdit.au3>
#include <ScrollBarsConstants.au3>
#include <GUIToolTip.au3>
#include <WinAPIDlg.au3>

Local $aWndPos
Local $vDos, $sline = ""

#Region ### START Koda GUI section ### Form=
Local $NetAs = GUICreate("NetAs-Network Assistant", 865, 457, 192, 124)
Local $idFilemenu = GUICtrlCreateMenu("&File")
Local $idSaveitem = GUICtrlCreateMenuItem("Save", $idFilemenu)
Local $idabout = GUICtrlCreateMenuItem("About", $idFilemenu)
Local $idExititem = GUICtrlCreateMenuItem("Exit", $idFilemenu)
Local $idEdit = GUICtrlCreateEdit("", 8, 8, 849, 339)
GUICtrlSetFont(-1, 10, 400, 0, "Courier")
GUICtrlSetBkColor(-1, 0x0000FF)
GUICtrlSetColor($idEdit, 0xFFFFFF)
Local $idInput = GUICtrlCreateInput("", 560, 360, 297, 21)
Local $Button1 = GUICtrlCreateButton("Run", 784, 384, 75, 25)
Local $Button2 = GUICtrlCreateButton("Clear", 696, 384, 75, 25)
Local $Group1 = GUICtrlCreateGroup("Commands", 8, 352, 489, 81)
Local $Button3 = GUICtrlCreateButton("IpConfig", 16, 368, 75, 25)
Local $Button4 = GUICtrlCreateButton("FlushDNS", 96, 368, 75, 25)
Local $Button5 = GUICtrlCreateButton("Release", 176, 368, 75, 25)
Local $Button6 = GUICtrlCreateButton("DisplayDNS", 256, 368, 75, 25)
Local $Button7 = GUICtrlCreateButton("Route Print", 336, 368, 75, 25)
Local $Button8 = GUICtrlCreateButton("ARP", 416, 368, 75, 25)
Local $Button9 = GUICtrlCreateButton("NSLookup", 16, 400, 75, 25)
Local $Button10 = GUICtrlCreateButton("NetStat", 96, 400, 75, 25)
Local $Button11 = GUICtrlCreateButton("GetMac", 176, 400, 75, 25)
Local $Button12 = GUICtrlCreateButton("Ping", 256, 400, 75, 25)
Local $Button13 = GUICtrlCreateButton("Adapters", 336, 400, 75, 25)
Local $Button14 = GUICtrlCreateButton("Multicast Joins", 416, 400, 75, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$hENTER = GUICtrlCreateDummy()
Dim $AccelKeys[1][2] = [["{ENTER}", $hENTER]] ; Set accelerators
GUISetAccelerators($AccelKeys)

While 1
    $nMsg = GUIGetMsg()
    Switch $nMsg
        Case $GUI_EVENT_CLOSE
            Exit
        Case $idExititem
            Exit
        Case $GUI_EVENT_CLOSE, $idabout
            MsgBox(64, "About", "NetAs-Network Assistant" _
                     & @CRLF & "Version 1.1" _
                     & @CRLF & "By Gexos" _
                     & @CRLF & @CRLF & "Designed in AutoIt with help by @subz ")
        Case $Button3
            GUICtrlSetData($idEdit, _CmdInfo() & @CRLF)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
        Case $idSaveitem
             Local $sFileSaveDialog = FileSaveDialog("Save File As", @ScriptDir, "Text Files (*.txt)", $FD_PATHMUSTEXIST)
            Local $editcontent = guictrlread($idEdit)
;~             ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $editcontent = ' & $editcontent & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
            FileWrite($sFileSaveDialog, $editcontent)
;~             ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : FileWrite("Save.txt", $sFileSaveDialog) = ' & FileWrite("Save.txt", $sFileSaveDialog) & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
        Case $Button4
            GUICtrlSetData($idEdit, _CmdInfo2() & @CRLF)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
        Case $Button5
            GUICtrlSetData($idEdit, _CmdInfo3() & @CRLF)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
        Case $Button6
            GUICtrlSetData($idEdit, _CmdInfo4() & @CRLF)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
        Case $Button7
            GUICtrlSetData($idEdit, _CmdInfo5() & @CRLF)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
        Case $Button8
            GUICtrlSetData($idEdit, _CmdInfo6() & @CRLF)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
        Case $Button9
            GUICtrlSetData($idEdit, _CmdInfo7() & @CRLF)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
        Case $Button10
            GUICtrlSetData($idEdit, _CmdInfo8() & @CRLF)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
        Case $Button11
            GUICtrlSetData($idEdit, _CmdInfo9() & @CRLF)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
        Case $Button12
            GUICtrlSetData($idEdit, _CmdInfo10() & @CRLF)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
		Case $Button13
            GUICtrlSetData($idEdit, _CmdInfo11() & @CRLF)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
		Case $Button14
            GUICtrlSetData($idEdit, _CmdInfo12() & @CRLF)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)
        Case $Button2
                GUICtrlSetData($idEdit, "")
        Case $Button1, $hENTER
                $vDos = Run(@ComSpec & " /c " & GUICtrlRead($idInput), @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
                While 1
                    $sline &= StdoutRead($vDos)
                    If @error Then ExitLoop
                WEnd
                GUICtrlSetData($idEdit, $sline & @CRLF)
                GUICtrlSetData($idInput, "")
                ;----> Reset
                $sline = ""
    EndSwitch
WEnd



Func _CmdInfo($_sCmdInfo = "ipconfig /all")
    Local $iPID = Run(@ComSpec & " /c " & $_sCmdInfo, "", @SW_HIDE,  BitOR($STDERR_CHILD, $STDOUT_CHILD))
    ; Wait until the process has closed using the PID returned by Run.
    ProcessWaitClose($iPID)
    ; Read the Stdout stream of the PID returned by Run. This can also be done in a while loop. Look at the example for StderrRead.
    Local $sOutput = StringReplace(StdoutRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sOutErr = StringReplace(StderrRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sReult = $sOutput <> "" ? $sOutput : $sOutErr
    Return $sReult
EndFunc
Func _CmdInfo2($_sCmdInfo2 = "IPConfig /FlushDNS")
    Local $iPID = Run(@ComSpec & " /c " & $_sCmdInfo2, "", @SW_HIDE,  BitOR($STDERR_CHILD, $STDOUT_CHILD))
    ; Wait until the process has closed using the PID returned by Run.
    ProcessWaitClose($iPID)
    ; Read the Stdout stream of the PID returned by Run. This can also be done in a while loop. Look at the example for StderrRead.
    Local $sOutput = StringReplace(StdoutRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sOutErr = StringReplace(StderrRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sReult = $sOutput <> "" ? $sOutput : $sOutErr
    Return $sReult
EndFunc
Func _CmdInfo3($_sCmdInfo3 = "IPConfig /Release")
    Local $iPID = Run(@ComSpec & " /c " & $_sCmdInfo3, "", @SW_HIDE,  BitOR($STDERR_CHILD, $STDOUT_CHILD))
    ; Wait until the process has closed using the PID returned by Run.
    ProcessWaitClose($iPID)
    ; Read the Stdout stream of the PID returned by Run. This can also be done in a while loop. Look at the example for StderrRead.
    Local $sOutput = StringReplace(StdoutRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sOutErr = StringReplace(StderrRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sReult = $sOutput <> "" ? $sOutput : $sOutErr
    Return $sReult
EndFunc
Func _CmdInfo4($_sCmdInfo4 = "ipconfig /displaydns")
    Local $iPID = Run(@ComSpec & " /c " & $_sCmdInfo4, "", @SW_HIDE,  BitOR($STDERR_CHILD, $STDOUT_CHILD))
    ; Wait until the process has closed using the PID returned by Run.
    ProcessWaitClose($iPID)
    ; Read the Stdout stream of the PID returned by Run. This can also be done in a while loop. Look at the example for StderrRead.
    Local $sOutput = StringReplace(StdoutRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sOutErr = StringReplace(StderrRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sReult = $sOutput <> "" ? $sOutput : $sOutErr
    Return $sReult
EndFunc
Func _CmdInfo5($_sCmdInfo5 = "Route Print")
    Local $iPID = Run(@ComSpec & " /c " & $_sCmdInfo5, "", @SW_HIDE,  BitOR($STDERR_CHILD, $STDOUT_CHILD))
    ; Wait until the process has closed using the PID returned by Run.
    ProcessWaitClose($iPID)
    ; Read the Stdout stream of the PID returned by Run. This can also be done in a while loop. Look at the example for StderrRead.
    Local $sOutput = StringReplace(StdoutRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sOutErr = StringReplace(StderrRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sReult = $sOutput <> "" ? $sOutput : $sOutErr
    Return $sReult
EndFunc
Func _CmdInfo6($_sCmdInfo6 = "ARP -a")
    Local $iPID = Run(@ComSpec & " /c " & $_sCmdInfo6, "", @SW_HIDE,  BitOR($STDERR_CHILD, $STDOUT_CHILD))
    ; Wait until the process has closed using the PID returned by Run.
    ProcessWaitClose($iPID)
    ; Read the Stdout stream of the PID returned by Run. This can also be done in a while loop. Look at the example for StderrRead.
    Local $sOutput = StringReplace(StdoutRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sOutErr = StringReplace(StderrRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sReult = $sOutput <> "" ? $sOutput : $sOutErr
    Return $sReult
EndFunc
Func _CmdInfo7($_sCmdInfo7 = "NSLookup")
    Local $iPID = Run(@ComSpec & " /c " & $_sCmdInfo7, "", @SW_HIDE,  BitOR($STDERR_CHILD, $STDOUT_CHILD))
    ; Wait until the process has closed using the PID returned by Run.
    ProcessWaitClose($iPID)
    ; Read the Stdout stream of the PID returned by Run. This can also be done in a while loop. Look at the example for StderrRead.
    Local $sOutput = StringReplace(StdoutRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sOutErr = StringReplace(StderrRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sReult = $sOutput <> "" ? $sOutput : $sOutErr
    Return $sReult
EndFunc
Func _CmdInfo8($_sCmdInfo8 = "netstat -aof")
    Local $iPID = Run(@ComSpec & " /c " & $_sCmdInfo8, "", @SW_HIDE,  BitOR($STDERR_CHILD, $STDOUT_CHILD))
    ; Wait until the process has closed using the PID returned by Run.
    ProcessWaitClose($iPID)
    ; Read the Stdout stream of the PID returned by Run. This can also be done in a while loop. Look at the example for StderrRead.
    Local $sOutput = StringReplace(StdoutRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sOutErr = StringReplace(StderrRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sReult = $sOutput <> "" ? $sOutput : $sOutErr
    Return $sReult
EndFunc
Func _CmdInfo9($_sCmdInfo9 = "getmac")
    Local $iPID = Run(@ComSpec & " /c " & $_sCmdInfo9, "", @SW_HIDE,  BitOR($STDERR_CHILD, $STDOUT_CHILD))
    ; Wait until the process has closed using the PID returned by Run.
    ProcessWaitClose($iPID)
    ; Read the Stdout stream of the PID returned by Run. This can also be done in a while loop. Look at the example for StderrRead.
    Local $sOutput = StringReplace(StdoutRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sOutErr = StringReplace(StderrRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sReult = $sOutput <> "" ? $sOutput : $sOutErr
    Return $sReult
EndFunc
Func _CmdInfo10($_sCmdInfo10 = "ping google.com")
    Local $iPID = Run(@ComSpec & " /c " & $_sCmdInfo10, "", @SW_HIDE,  BitOR($STDERR_CHILD, $STDOUT_CHILD))
    ; Wait until the process has closed using the PID returned by Run.
    ProcessWaitClose($iPID)
    ; Read the Stdout stream of the PID returned by Run. This can also be done in a while loop. Look at the example for StderrRead.
    Local $sOutput = StringReplace(StdoutRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sOutErr = StringReplace(StderrRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sReult = $sOutput <> "" ? $sOutput : $sOutErr
    Return $sReult
EndFunc
Func _CmdInfo11($_sCmdInfo11 = "Netsh interface ip show config")
    Local $iPID = Run(@ComSpec & " /c " & $_sCmdInfo11, "", @SW_HIDE,  BitOR($STDERR_CHILD, $STDOUT_CHILD))
    ; Wait until the process has closed using the PID returned by Run.
    ProcessWaitClose($iPID)
    ; Read the Stdout stream of the PID returned by Run. This can also be done in a while loop. Look at the example for StderrRead.
    Local $sOutput = StringReplace(StdoutRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sOutErr = StringReplace(StderrRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sReult = $sOutput <> "" ? $sOutput : $sOutErr
    Return $sReult
EndFunc
Func _CmdInfo12($_sCmdInfo12 = "netsh interface ip show joins")
    Local $iPID = Run(@ComSpec & " /c " & $_sCmdInfo12, "", @SW_HIDE,  BitOR($STDERR_CHILD, $STDOUT_CHILD))
    ; Wait until the process has closed using the PID returned by Run.
    ProcessWaitClose($iPID)
    ; Read the Stdout stream of the PID returned by Run. This can also be done in a while loop. Look at the example for StderrRead.
    Local $sOutput = StringReplace(StdoutRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sOutErr = StringReplace(StderrRead($iPID), @CRLF & @CRLF, @CRLF)
    Local $sReult = $sOutput <> "" ? $sOutput : $sOutErr
    Return $sReult
EndFunc