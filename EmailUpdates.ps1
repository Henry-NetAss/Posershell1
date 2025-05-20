#Get PC Details--------------------------------------------------------------------------------------------------------------------------------------------------
$PCName = $env:COMPUTERNAME
$User = $env:username
$UDomain = $env:userdomain
$UserLocalProfile = $env:USERPROFILE
#Email 
$User = "canon@nasupport.co.za"
$Password = "ca@NA101"
$cred=New-Object System.Net.NetworkCredential(“canon@nasupport.co.za”, “ca@NA101”);
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { return $true }
$EmailTo = "henry@networkassociates.co.za"
$EmailFrom = "mail@nasupport.co.za"
$Subject = "Temoso Windows Updates $env:USERNAME"
$Body = "Check Attachment for any updates installed for $env:USERNAME"
$SMTPServer = “smtp.nasupport.co.za"
$filenameAndPath = "C:\NA\Tasks\Updates.zip"
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($cred.UserName, $cred.Password);
$SMTPClient.Send($SMTPMessage)