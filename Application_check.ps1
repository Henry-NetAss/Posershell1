$INSTALLED = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName, DisplayVersion, Publisher, InstallDate, InstallLocation
$INSTALLED += Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate, InstallLocation
$INSTALLED | ?{ $_.DisplayName -ne $null } | sort-object -Property DisplayName -Unique | Format-Table DisplayName,InstallDate,Publisher |Out-File C:\NA\Apps.txt

###### Keyword check for Bloatware ######

$p = @("Avast","Mcafee","Norton","Ccleaner","Mailware","Opera","AVG","Windows PC Health Check","defraggler")
Get-Content "C:\NA\Apps.txt" | Select-String -Pattern $p -SimpleMatch | Set-Content C:\NA\Bloatware.txt

###### Send mail ######

$cred=New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, (Get-Content $File | ConvertTo-SecureString -AsPlainText -Force)
$EmailTo = "henry@networkassociates.co.za"
$EmailFrom = "henry@networkassociates.co.za"
$Subject = "Bloatware Installed"
$Body = Get-Content C:\Na\Bloatware.txt
$SMTPServer = "smtp.office365.com"
$filenameAndPath = "C:\NA\Bloatware.txt"
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 993)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("henry@networkassociates.co.za", "ybQ3l004");
$SMTPClient.Send($SMTPMessage)