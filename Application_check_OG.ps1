


$INSTALLED = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName, DisplayVersion, Publisher, InstallDate, InstallLocation
$INSTALLED += Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate, InstallLocation
$INSTALLED | Where-Object{ $_.DisplayName -ne $null } | sort-object -Property DisplayName -Unique | Format-Table DisplayName,InstallDate,Publisher |Out-File C:\NA\Apps.txt

###### Keyword check for Bloatware ######

$p = @("Avast","Mcafee","Norton","Ccleaner","Malware","Opera","AVG","Windows PC Health Check","defraggler","epic","Steam","")
Get-Content "C:\NA\Apps.txt" | Select-String -Pattern $p -SimpleMatch | Set-Content C:\NA\Bloatware.txt

###### Send mail ######
$FileName = "C:\NA\Bloatware.txt"
if (Test-Path $FileName) {
    $User = "henry.cloete1111@outlook.com"
    $Password = "Handre1204!"
    $cred=New-Object System.Net.NetworkCredential("henry.cloete1111@outlook.com", "Handre1204!");
    [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { return $true }
    $EmailTo = "henry@networkassociates.co.za"
    $EmailFrom = "henry.cloete1111@outlook.com"
    $Subject = "Temoso Windows Updates"
    $Body = "Checked Attachment for any updates installed"
    $SMTPServer = “smtp.office365.com"
    $filenameAndPath = "C:\NA\Bloatware.txt"
    $SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
    $attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
    $SMTPMessage.Attachments.Add($attachment)
    $SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer,587)
    $SMTPClient.EnableSsl = $true
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential($cred.UserName, $cred.Password);
    $SMTPClient.Send($SMTPMessage)
}
else
{
    exit
}