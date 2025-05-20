#Prgrammed and designed by Henry Cloete - Network Associates
#Gathers info of the computer related to AnyDesk and sends it to email recepient

#Gets WAN IP address---------------------------------------------------------------------------------------------------------------------------------------------
$url = "http://checkip.dyndns.com"  
$webclient = New-Object System.Net.WebClient 
$Ip = $webclient.DownloadString($url) 
$Ip2 = $Ip.ToString() 
$ip3 = $Ip2.Split(" ") 
$ip4 = $ip3[5] 
$ip5 = $ip4.replace("</body>","") 
$FinalIPAddress = $ip5.replace("</html>","") 
#End of Get WAN IP Address---------------------------------------------------------------------------------------------------------------------------------------

#AnyDesk ID Get--------------------------------------------------------------------------------------------------------------------------------------------------
$strLoggedOnUser = $env:USERPROFILE
$strAnyDeskConf = "\appdata\roaming\AnyDesk\system.conf"
$strAnyDeskId = ""
$strAnyDeskConf2 = "\programdata\AnyDesk\system.conf"
$strAnyDeskId2 = ""
      
$strAnyDeskId = (Get-Content ($strLoggedOnUser + "\" + $strAnyDeskConf) | Select-String -Pattern "ad.anynet.id").ToString().Trim() -replace "ad.anynet.id="
$strAnyDeskId2 = (Get-Content ($env:SystemDrive + $strAnyDeskConf2) | Select-String -Pattern "ad.anynet.id").ToString().Trim() -replace "ad.anynet.id="
#AnyDesk ID Capture Finished------------------------------------------------------------------------------------------------------------------------------------


#Get PC Details--------------------------------------------------------------------------------------------------------------------------------------------------
$PCName = $env:COMPUTERNAME
$User = $env:username
$UDomain = $env:userdomain
$UserLocalProfile = $env:USERPROFILE
#End get PC Details----------------------------------------------------------------------------------------------------------------------------------------------

#Compile and Send Email------------------------------------------------------------------------------------------------------------------------------------------
$cred=New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, (Get-Content $File | ConvertTo-SecureString -AsPlainText -Force)
$EmailTo = "henry@networkassociates.co.za"
$EmailFrom = "canon@nasupport.co.za"
$Subject = "Test"
$Body = "this is a test"
$SMTPServer = “smtp.nasupport.co.za"
$filenameAndPath = "C:\AutoUpdates\History\test.txt"
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential(“canon@nasupport.co.za”, “ca@NA101”);
$SMTPClient.Send($SMTPMessage)
#End Sending Email-----------------------------------------------------------------------------------------------------------------------------------------------