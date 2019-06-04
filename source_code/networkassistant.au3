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
$NetAs = GUICreate("NetAs-Network Assistant", 1096, 521, 182, 135)
Local $idFilemenu = GUICtrlCreateMenu("&File")
Local $idSaveitem = GUICtrlCreateMenuItem("Save", $idFilemenu)
Local $idabout = GUICtrlCreateMenuItem("About", $idFilemenu)
Local $idExititem = GUICtrlCreateMenuItem("Exit", $idFilemenu)
Local $idInput = GUICtrlCreateEdit("", 168, 34, 921, 465)
GUICtrlSetFont(-1, 10, 400, 0, "Courier")
GUICtrlSetBkColor(-1, 0x0000FF)
GUICtrlSetColor($idInput, 0xFFFFFF)
Local $Button1 = GUICtrlCreateButton("IPconfig", 48, 56, 75, 25)
Local $Button3 = GUICtrlCreateButton("FlushDNS", 48, 96, 75, 25)
Local $Button5 = GUICtrlCreateButton("ConnRelease", 48, 136, 75, 25)
Local $Button7 = GUICtrlCreateButton("DisplayDNS", 48, 176, 75, 25)
Local $Button9 = GUICtrlCreateButton("Route Print", 48, 216, 75, 25)
Local $Button11 = GUICtrlCreateButton("ARP", 48, 256, 75, 25)
Local $Button13 = GUICtrlCreateButton("NSLookup", 48, 296, 75, 25)
Local $Button15 = GUICtrlCreateButton("NetStat -an", 48, 336, 75, 25)
Local $Button17 = GUICtrlCreateButton("GetMac", 48, 376, 75, 25)
Local $Button19 = GUICtrlCreateButton("Ping", 48, 416, 75, 25)
Local $Button23 = GUICtrlCreateButton("Run", 656, 8, 73, 25)
Local $Button24 = GUICtrlCreateButton("Clear", 576, 8, 75, 25)

Local $Input1 = GUICtrlCreateInput("", 736, 8, 345, 21)
GUISetState(@SW_SHOW)
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
        Case $Button1
            GUICtrlSetData($idInput, _CmdInfo() & @CRLF)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
        Case $idSaveitem
             Local $sFileSaveDialog = FileSaveDialog("Save File As", @ScriptDir, "Text Files (*.txt)", $FD_PATHMUSTEXIST)
            Local $editcontent = guictrlread($idInput)
;~             ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $editcontent = ' & $editcontent & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
            FileWrite($sFileSaveDialog, $editcontent)
;~             ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : FileWrite("Save.txt", $sFileSaveDialog) = ' & FileWrite("Save.txt", $sFileSaveDialog) & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
        Case $Button3
            GUICtrlSetData($idInput, _CmdInfo2() & @CRLF)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
        Case $Button5
            GUICtrlSetData($idInput, _CmdInfo3() & @CRLF)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
        Case $Button7
            GUICtrlSetData($idInput, _CmdInfo4() & @CRLF)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
        Case $Button9
            GUICtrlSetData($idInput, _CmdInfo5() & @CRLF)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
        Case $Button11
            GUICtrlSetData($idInput, _CmdInfo6() & @CRLF)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
        Case $Button13
            GUICtrlSetData($idInput, _CmdInfo7() & @CRLF)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
        Case $Button15
            GUICtrlSetData($idInput, _CmdInfo8() & @CRLF)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
        Case $Button17
            GUICtrlSetData($idInput, _CmdInfo9() & @CRLF)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
        Case $Button19
            GUICtrlSetData($idInput, _CmdInfo10() & @CRLF)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
            _GUICtrlEdit_Scroll($idInput, $SB_SCROLLCARET)
        Case $Button24
                GUICtrlSetData($idInput, "")
        Case $Button23, $hENTER
                $vDos = Run(@ComSpec & " /c " & GUICtrlRead($Input1), @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
                While 1
                    $sline &= StdoutRead($vDos)
                    If @error Then ExitLoop
                WEnd
                GUICtrlSetData($idInput, $sline & @CRLF)
                GUICtrlSetData($Input1, "")
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