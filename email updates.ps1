$cred=New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, (Get-Content $File | ConvertTo-SecureString -AsPlainText -Force)
$EmailTo = "henry@networkassociates.co.za"
$EmailFrom = "himoinsa@nasupport.co.za"
$Subject = "Test"
$Body = "this is a test"
$SMTPServer = "mail.nasupport.co.za"
$filenameAndPath = "C:\NA\Installation\Apps.txt"
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("himoinsa@nasupport.co.za", "hi@NA101");
$SMTPClient.Send($SMTPMessage)