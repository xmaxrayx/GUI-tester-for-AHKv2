#Requires AutoHotkey v2.0
#SingleInstance Force
#Warn All, off
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 09:57:38  on 25/12/2023   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}
; ver : 0.1
guiTesterMain()

guiTesterMain()
{
guiMain := Gui()
guiMain.Add("Text","w200 xm", "Status :")
guiStatus := guiMain.Add("Text","w200 yp", "New")
guiScript := guiMain.Add("Edit","w400 xm h200 vOK ",)
guiOk := guiMain.Add("Button","w100", "ok").OnEvent("Click" , (*)=> guiScriptDebug(guiScript.Value))
guiMain.Show()


guiScript.OnEvent("Change" , (*)=> guiScriptDebug(guiScript.Value))


guiScriptDebug(text){
    try {
        ExecScript(text,false)
        
    } catch Error as e {
        MsgBox e
    }
}





ExecScript(Script, Wait := True) {
    try {
    #Warn All, off


    Script := ("#Warn All, off `n try {`n" . Script . "`n} catch Error as e { `n  MsgBox(e.Message) `n }")
    shell := ComObject("WScript.Shell")
    exec := shell.Exec("AutoHotkey.exe /ErrorStdOut *")
        exec.StdIn.Write(Script)
        exec.StdIn.Close()
        if Wait
        return exec.StdOut.ReadAll()

    } catch Error as e {
       ; guiStatus.Value := e.Message 

       MsgBox "lol"
    }
    
}



}

