#Requires AutoHotkey v2.0

; n := Gui()

; n.Add("Text","w200 xm", "Status :")
; n.Add("Text","w200 yp", "New")
; n.Show()



ExecScript(Script, Wait:=true)
{
    shell := ComObject("WScript.Shell")
    exec := shell.Exec("AutoHotkey.exe /ErrorStdOut *")
    exec.StdIn.Write(Script)
    exec.StdIn.Close()
    if Wait
        return exec.StdOut.ReadAll()
}

; Example:
ib := InputBox("Enter an expression to evaluate as a new script.",,, 'Ord("*")')
if ib.result = "Cancel"
    return
result := ExecScript('FileAppend ' ib.value ', "*"')
MsgBox "Result: " result