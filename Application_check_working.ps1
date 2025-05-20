$path = "C:\Na\Installation"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}
$INSTALLED = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName, DisplayVersion, Publisher, InstallDate, InstallLocation
$INSTALLED += Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate, InstallLocation
$INSTALLED | ?{ $_.DisplayName -ne $null } | sort-object -Property DisplayName -Unique | Format-Table DisplayName,InstallDate,Publisher |Out-File C:\NA\Apps.txt

###### Keyword check for Bloatware ######

$p = @("Eclipse Temurinn JDK with Hotspot 8u352-b08 (x64)","Eclipse Temurin JDK with Hotspot 11.0.17+8 (64)","ESET Endpoint Security","Google Chrome","Microsoft 365 Apps for","NetTime","TSPrint Client","Adobe","AnyDesk","TeamViewer")
Get-Content "C:\NA\Apps.txt" | Select-String -Pattern $p -SimpleMatch | Set-Content C:\NA\Bloatware.txt

###### Send mail ######
$FileName = "C:\NA\Bloatware.txt"
if (Test-Path $FileName) {
    $PCName = $env:USERNAME
    $cred=New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, (Get-Content $File | ConvertTo-SecureString -AsPlainText -Force)
    $EmailTo = "henry@networkassociates.co.za"
    $EmailFrom = "dianne@truckworldparts.co.za"
    $Subject = "Bloatware Installed at Himoinsa on $PCName"
    $Body = "Please check attachment for Installed Bloatware"
    $SMTPServer = "mail.truckworldparts.co.za"
    $filenameAndPath = "C:\NA\Bloatware.txt"
    $SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
    $attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
    $SMTPMessage.Attachments.Add($attachment)
    $SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 465)
    $SMTPClient.EnableSsl = $true
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
    $SMTPClient.Send($SMTPMessage)
}
else
{
    exit
}