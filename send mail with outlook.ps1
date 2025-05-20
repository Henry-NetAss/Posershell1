$EmailFrom = "henry@networkassociates.co.za"
$EmailTo = "ricky@networkassociates.co.za"  
$Subject = "today date"
$Body = "TODAY SYSTEM DATE=01/04/2016  SYSTEM TIME=11:32:05.50"
$filenameAndPath = "C:\NA\apps.txt"
$SMTPServer = "smtp.office365.com"
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)   
$SMTPClient.EnableSsl = $true    
$SMTPClient.Credentials = New-Object 
System.Net.NetworkCredential("henry@networkassociates.co.za", "Nom31308")    
$SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body, $filenameAndPath)