

$User = "lanasim@crosswaysvm.co.za"
$Password = "Nug61111"
$cred=New-Object System.Net.NetworkCredential("lanasim@crosswaysvm.co.za", "Nug61111");
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { return $true }
$EmailTo = "leroy@networkassociates.co.za"
$EmailFrom = "lanasim@crosswaysvm.co.za"
$Subject = "this is a test"
$Body = "Checked Attachment for any updates installed"
$SMTPServer = “smtp.office365.com"
$filenameAndPath = "C:\NA\apps.txt"
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer,587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($cred.UserName, $cred.Password);
$SMTPClient.Send($SMTPMessage)