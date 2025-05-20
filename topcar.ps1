$path = "C:\Na
"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}
set-location c:\na
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$testform = New-Object System.Windows.Forms.Form
$testform.Text = 'Date'
$testform.Size = New-Object System.Drawing.Size(275,200)
$testform.StartPosition = 'CenterScreen'
$okb = New-Object System.Windows.Forms.Button
$okb.Location = New-Object System.Drawing.Point(5,110)
$okb.Size = New-Object System.Drawing.Size(75,25)
$okb.Text = 'OK'
$okb.DialogResult = [System.Windows.Forms.DialogResult]::OK
$testform.AcceptButton = $okb
$testform.Controls.Add($okb)
$test = New-Object System.Windows.Forms.Button
$test = New-Object System.Windows.Forms.Button
$test.Location = New-Object System.Drawing.Point(170,110)
$test.Size = New-Object System.Drawing.Size(75,25)
$test.Text = 'close'
$test.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$testform.AcceptButton = $test
$testform.Controls.Add($test)
$lb = New-Object System.Windows.Forms.Label
$lb.Location = New-Object System.Drawing.Point(20,40)
$lb.Size = New-Object System.Drawing.Size(240,400)
$lb.Text = 'Please enter your Site, Name, Surname and Email - Example Liquorland-Piet Pompies-lekker@bydiesee.co.za'
$testform.Controls.Add($lb)
#Field to type
$tb = New-Object System.Windows.Forms.TextBox
$tb.Location = New-Object System.Drawing.Point(40,80)
$tb.Size = New-Object System.Drawing.Size(150,20)
$testform.Controls.Add($tb)
$testform.Topmost = $true
$testform.Add_Shown({$tb.Select()})
$rs = $testform.ShowDialog()
if ($rs -eq [System.Windows.Forms.DialogResult]::OK)
{
$y = $tb.Text
Write-Host ""
$y| Out-File -FilePath c:\NA\Info.txt
}
Get-ComputerInfo -Property CSName|Out-File C:\NA\pc.txt
start-sleep -seconds 15
$EmailTo = "henry@networkassociates.co.za"
$EmailFrom = "henry@networkassociates.co.za"
$Subject = Get-Content c:\na\info.txt
$Body = get-content c:\na\pc.txt
$SMTPServer = "smtp.office365.com"
$filenameAndPath = "c:\na\pc.txt"
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("henry@networkassociates.co.za", "Nom31308");
$SMTPClient.Send($SMTPMessage)