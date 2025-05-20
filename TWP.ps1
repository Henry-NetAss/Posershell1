#Date

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
$lb.Size = New-Object System.Drawing.Size(240,30)
$lb.Text = 'Please type Year and Month. EXAMPLE - 202409'
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
$y| Out-File -FilePath c:\drs\Statements\Date.txt
}



#Email Subject
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$testform = New-Object System.Windows.Forms.Form
$testform.Text = 'Email Subject'
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
$lb.Size = New-Object System.Drawing.Size(240,30)
$lb.Text = 'Please type your email subject'
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
$y| Out-File -FilePath c:\drs\Statements\Email.txt
}

Add-Type -AssemblyName System.Windows.Forms
 
$progressForm = New-Object System.Windows.Forms.Form
$progressForm.Width = 300
$progressForm.Height = 150
$progressForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$progressForm.Text = "Sending Statements"
 
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(10, 50)
$progressBar.Size = New-Object System.Drawing.Size(280, 20)
$progressForm.Controls.Add($progressBar)
 
$progressLabel = New-Object System.Windows.Forms.Label
$progressLabel.Location = New-Object System.Drawing.Point(10, 20)
$progressLabel.Size = New-Object System.Drawing.Size(280, 20)
$progressLabel.Text = "0% Complete"
$progressLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$progressForm.Controls.Add($progressLabel)
 
$progressForm.Show()
 
$data = 1..100
$index = 1
# Loop through the data and update the progress bar
foreach ($item in $data) {
    # Perform some operation on $item
 
    # Update the progress bar
    $progressPercent = ($index / $data.Count) * 100
    $progressBar.Value = $progressPercent
    $progressLabel.Text = "$progressPercent% Complete"
    Start-Sleep -Milliseconds 7000
    $index++
}
 
$progressForm.Close()

#Folder location
$folder = get-content C:\drs\statements\Date.txt
set-location c:\drs\statements\$folder
$filename = "C:\drs\statements\$folder\StatementE_202409_A003.pdf"
if (Test-Path $FileName) {
$EmailTo = "mandy@aepe.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # do nothing
}

$filename = "C:\drs\statements\$folder\StatementE_202409_A007.pdf"
if (Test-Path $FileName) {
$EmailTo = "reynierk@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}
start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_A009.pdf"
if (Test-Path $FileName) {
$EmailTo = "a.ndiesel@telkomsa.net"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}
start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_A009.pdf"
if (Test-Path $FileName) {
$EmailTo = "a.ndiesel@telkomsa.net"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_A010.pdf"
if (Test-Path $FileName) {
$EmailTo = "m.williams@anderson.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_A011.pdf"
if (Test-Path $FileName) {
$EmailTo = "sa-invoices@ale-heavylift.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_A012.pdf"
if (Test-Path $FileName) {
$EmailTo = "donay@aloeoil.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_A013.pdf"
if (Test-Path $FileName) {
$EmailTo = "shantel@autoprolek.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_A014.pdf"
if (Test-Path $FileName) {
$EmailTo = "accounts@avntransport.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_A015.pdf"
if (Test-Path $FileName) {
$EmailTo = "accounts@agramex.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_A016.pdf"
if (Test-Path $FileName) {
$EmailTo = "dorisia.dp@d-a.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_A017.pdf"
if (Test-Path $FileName) {
$EmailTo = "Yolandy@aerotruck.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_B001.pdf"
if (Test-Path $FileName) {
$EmailTo = "barenddejagerbc@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_B002.pdf"
if (Test-Path $FileName) {
$EmailTo = "c.bceng@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_B003.pdf"
if (Test-Path $FileName) {
$EmailTo = "bjj@cjpartners.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_B006.pdf"
if (Test-Path $FileName) {
$EmailTo = "myrna@billsontrucks.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_B007.pdf"
if (Test-Path $FileName) {
$EmailTo = "kdx@cybersmart.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_B008.pdf"
if (Test-Path $FileName) {
$EmailTo = "conradieoffice@telkomsa.net"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_B011.pdf"
if (Test-Path $FileName) {
$EmailTo = "ainslielaurika@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_B012.pdf"
if (Test-Path $FileName) {
$EmailTo = "belindavanjaarsveld@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_B013.pdf"
if (Test-Path $FileName) {
$EmailTo = "gloun@burma.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_B014.pdf"
if (Test-Path $FileName) {
$EmailTo = "tracey@dynaform.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_B015.pdf"
if (Test-Path $FileName) {
$EmailTo = "zunene@billsontrucks.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_C002.pdf"
if (Test-Path $FileName) {
$EmailTo = "coastline@ragears.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_C003.pdf"
if (Test-Path $FileName) {
$EmailTo = "cmvlakvark@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_C005.pdf"
if (Test-Path $FileName) {
$EmailTo = "cradocksaad2@isat.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_C010.pdf"
if (Test-Path $FileName) {
$EmailTo = "planthire@climaxconcrete.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_C013.pdf"
if (Test-Path $FileName) {
$EmailTo = "catcoplant@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_C11.pdf"
if (Test-Path $FileName) {
$EmailTo = "bothac.za@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_A009.pdf"
if (Test-Path $FileName) {
$EmailTo = "a.ndiesel@telkomsa.net"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_C24.pdf"
if (Test-Path $FileName) {
$EmailTo = "info@castlecranehire.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_C25.pdf"
if (Test-Path $FileName) {
$EmailTo = "michelle@concordcranes.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_C26.pdf"
if (Test-Path $FileName) {
$EmailTo = "admin@c-gtruckbodies.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_C27.pdf"
if (Test-Path $FileName) {
$EmailTo = "michelle@builditcd.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_D001.pdf"
if (Test-Path $FileName) {
$EmailTo = "dondertrucks.pe@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_D002.pdf"
if (Test-Path $FileName) {
$EmailTo = "dirkpettittransport@telkomsa.net"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_D003.pdf"
if (Test-Path $FileName) {
$EmailTo = "admin@muirtransport.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_D006.pdf"
if (Test-Path $FileName) {
$EmailTo = "joleen@dargroup.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_A009.pdf"
if (Test-Path $FileName) {
$EmailTo = "a.ndiesel@telkomsa.net"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_D007.pdf"
if (Test-Path $FileName) {
$EmailTo = "monica@denysedwards.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_D008.pdf"
if (Test-Path $FileName) {
$EmailTo = "admin@nabtiq.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_D009.pdf"
if (Test-Path $FileName) {
$EmailTo = "dirk@blueskysa.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_D010.pdf"
if (Test-Path $FileName) {
$EmailTo = "accounts@dynamicexpress.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_D012.pdf"
if (Test-Path $FileName) {
$EmailTo = "info@speedtruck.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_D013.pdf"
if (Test-Path $FileName) {
$EmailTo = "drwvervoer2020@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_E003.pdf"
if (Test-Path $FileName) {
$EmailTo = "andrew@ects.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_E004.pdf"
if (Test-Path $FileName) {
$EmailTo = "eme@501.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_E007.pdf"
if (Test-Path $FileName) {
$EmailTo = "telishia@elh.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_E008.pdf"
if (Test-Path $FileName) {
$EmailTo = "helene@epmufflers.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_E009.pdf"
if (Test-Path $FileName) {
$EmailTo = "hoofkantoor@eccontracting.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_E010.pdf"
if (Test-Path $FileName) {
$EmailTo = "vikash.bramdaw@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_F001.pdf"
if (Test-Path $FileName) {
$EmailTo = "admin4@fsolutions.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_F002.pdf"
if (Test-Path $FileName) {
$EmailTo = "ferobrake@ferobrakepe.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_F004.pdf"
if (Test-Path $FileName) {
$EmailTo = "fatty@iexchange.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_F005.pdf"
if (Test-Path $FileName) {
$EmailTo = "vorster.venter@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_F006.pdf"
if (Test-Path $FileName) {
$EmailTo = "accounts@fawtrucks.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_F007.pdf"
if (Test-Path $FileName) {
$EmailTo = "assistfarm@ffg.org.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_F008.pdf"
if (Test-Path $FileName) {
$EmailTo = "office@zivuma.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_G004.pdf"
if (Test-Path $FileName) {
$EmailTo = "gvmcv.reception@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_G005.pdf"
if (Test-Path $FileName) {
$EmailTo = "gvdonald@intekom.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_G006.pdf"
if (Test-Path $FileName) {
$EmailTo = "elizahg@d-a.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_G008.pdf"
if (Test-Path $FileName) {
$EmailTo = "gsautolex@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_G009.pdf"
if (Test-Path $FileName) {
$EmailTo = "gh.collett@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_G010.pdf"
if (Test-Path $FileName) {
$EmailTo = "creditors@glendoresand.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_A009.pdf"
if (Test-Path $FileName) {
$EmailTo = "a.ndiesel@telkomsa.net"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_H002.pdf"
if (Test-Path $FileName) {
$EmailTo = "hvh.transport@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_H003.pdf"
if (Test-Path $FileName) {
$EmailTo = "emmerentiavz@satb.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_H005.pdf"
if (Test-Path $FileName) {
$EmailTo = "albert@harbronam.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_H008.pdf"
if (Test-Path $FileName) {
$EmailTo = "leslie@hoodstransport.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_A009.pdf"
if (Test-Path $FileName) {
$EmailTo = "a.ndiesel@telkomsa.net"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_H009.pdf"
if (Test-Path $FileName) {
$EmailTo = "kred4@hestony.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_H010.pdf"
if (Test-Path $FileName) {
$EmailTo = "office@venterplanthire.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_H011.pdf"
if (Test-Path $FileName) {
$EmailTo = "accounts@harmsevervoer.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_I005.pdf"
if (Test-Path $FileName) {
$EmailTo = "yonela@ibhaiclearing.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_I008.pdf"
if (Test-Path $FileName) {
$EmailTo = "admin@intercoastal.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_I009.pdf"
if (Test-Path $FileName) {
$EmailTo = "finance@idpowergen.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_J004.pdf"
if (Test-Path $FileName) {
$EmailTo = "admin2@jfmlog.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_J006.pdf"
if (Test-Path $FileName) {
$EmailTo = "mrtipper@geenet.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_J007.pdf"
if (Test-Path $FileName) {
$EmailTo = "tiffanie@jmrgroup.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_K005.pdf"
if (Test-Path $FileName) {
$EmailTo = "morne@karoo.ochse.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_K006.pdf"
if (Test-Path $FileName) {
$EmailTo = "zarius@hankeypack.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_K008.pdf"
if (Test-Path $FileName) {
$EmailTo = "kktt@vodamail.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_K009.pdf"
if (Test-Path $FileName) {
$EmailTo = "michelle.barnard@kempston.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_L003.pdf"
if (Test-Path $FileName) {
$EmailTo = "wleroux@adsactive.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_L006.pdf"
if (Test-Path $FileName) {
$EmailTo = "lerouxb@lantic.net"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_L007.pdf"
if (Test-Path $FileName) {
$EmailTo = "info@ubuntubricks.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_L008.pdf"
if (Test-Path $FileName) {
$EmailTo = "karenb@lanko.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_L009.pdf"
if (Test-Path $FileName) {
$EmailTo = "admin@laserauto.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_L010.pdf"
if (Test-Path $FileName) {
$EmailTo = "admin@lmdbodyworks.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_M002.pdf"
if (Test-Path $FileName) {
$EmailTo = "nokfin@algoanet.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_M006.pdf"
if (Test-Path $FileName) {
$EmailTo = "mikedelange@mweb.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_M009.pdf"
if (Test-Path $FileName) {
$EmailTo = "morlinvervoer@vodamail.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_M012.pdf"
if (Test-Path $FileName) {
$EmailTo = "sonja@makanabrick.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_M013.pdf"
if (Test-Path $FileName) {
$EmailTo = "marazin@metroquarries.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_M014.pdf"
if (Test-Path $FileName) {
$EmailTo = "accounts@mvermaak.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_MOO8.pdf"
if (Test-Path $FileName) {
$EmailTo = "accounts@mikedelange.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_N001.pdf"
if (Test-Path $FileName) {
$EmailTo = "nokplan@agnet.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_N002.pdf"
if (Test-Path $FileName) {
$EmailTo = "thalana@neulux.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_N005.pdf"
if (Test-Path $FileName) {
$EmailTo = "creditors@fleetdynamics.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_O001.pdf"
if (Test-Path $FileName) {
$EmailTo = "oscar@langkloof.net"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_P001.pdf"
if (Test-Path $FileName) {
$EmailTo = "creditors@peairbrakes.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_P008.pdf"
if (Test-Path $FileName) {
$EmailTo = "pws@igen.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_P009.pdf"
if (Test-Path $FileName) {
$EmailTo = "pierrevandermescht@gmail.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_P011.pdf"
if (Test-Path $FileName) {
$EmailTo = "admin.accounts@konicaminoltasky.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_P012.pdf"
if (Test-Path $FileName) {
$EmailTo = "bmichau@intekom.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_P013.pdf"
if (Test-Path $FileName) {
$EmailTo = "accounts@pixilor.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_POO2.pdf"
if (Test-Path $FileName) {
$EmailTo = "pierre@tlconnect.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_PW001.pdf"
if (Test-Path $FileName) {
$EmailTo = "pws@igen.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_R3.pdf"
if (Test-Path $FileName) {
$EmailTo = "ddt@rainbowbeach.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_R4.pdf"
if (Test-Path $FileName) {
$EmailTo = "roslind@randcivils.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_R9.pdf"
if (Test-Path $FileName) {
$EmailTo = "accounts@tngroup.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_R10.pdf"
if (Test-Path $FileName) {
$EmailTo = "office@igen.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S002.pdf"
if (Test-Path $FileName) {
$EmailTo = "sunadmin@srvalley.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S003.pdf"
if (Test-Path $FileName) {
$EmailTo = "creditors@scribcon.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S006.pdf"
if (Test-Path $FileName) {
$EmailTo = "creditors@stu.co.za "
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S007.pdf"
if (Test-Path $FileName) {
$EmailTo = "admin@speedtruck.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S008.pdf"
if (Test-Path $FileName) {
$EmailTo = "pws@igen.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S011.pdf"
if (Test-Path $FileName) {
$EmailTo = "pws@igen.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S012.pdf"
if (Test-Path $FileName) {
$EmailTo = "eccreditors@scribcon.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S013.pdf"
if (Test-Path $FileName) {
$EmailTo = "silungisa@mweb.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S014.pdf"
if (Test-Path $FileName) {
$EmailTo = "beverley@superairbrakesystems.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S015.pdf"
if (Test-Path $FileName) {
$EmailTo = "joehley@antalis.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S018.pdf"
if (Test-Path $FileName) {
$EmailTo = "ninon@absamail.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S019.pdf"
if (Test-Path $FileName) {
$EmailTo = "accounts@supremetruck.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S020.pdf"
if (Test-Path $FileName) {
$EmailTo = "creditors.pe@milltrans.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S20.pdf"
if (Test-Path $FileName) {
$EmailTo = "info@plantfinder.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S25.pdf"
if (Test-Path $FileName) {
$EmailTo = "sealtransport@telkomsa.net"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S28.pdf"
if (Test-Path $FileName) {
$EmailTo = "tania@saltpan.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S29.pdf"
if (Test-Path $FileName) {
$EmailTo = "simpsontrading1@outlook.com"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S30.pdf"
if (Test-Path $FileName) {
$EmailTo = "creditors@supacrush.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S31.pdf"
if (Test-Path $FileName) {
$EmailTo = "colleen.erasmus@spar.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S34.pdf"
if (Test-Path $FileName) {
$EmailTo = "accounts@skdiesels.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_S35.pdf"
if (Test-Path $FileName) {
$EmailTo = "info@springwell.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_T006.pdf"
if (Test-Path $FileName) {
$EmailTo = "accounts@tngroup.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_T007.pdf"
if (Test-Path $FileName) {
$EmailTo = "trailrite@imaginet.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_T009.pdf"
if (Test-Path $FileName) {
$EmailTo = "admin@tkstransport.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_T011.pdf"
if (Test-Path $FileName) {
$EmailTo = "asanda@invictuslogistics.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_T014.pdf"
if (Test-Path $FileName) {
$EmailTo = "priscilla@toanywhere.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_T015.pdf"
if (Test-Path $FileName) {
$EmailTo = "priscilla@toanywhere.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_T016.pdf"
if (Test-Path $FileName) {
$EmailTo = "zieyaana@toraylogistics.co.zat"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_A009.pdf"
if (Test-Path $FileName) {
$EmailTo = "a.ndiesel@telkomsa.net"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_T017.pdf"
if (Test-Path $FileName) {
$EmailTo = "T017"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_U001.pdf"
if (Test-Path $FileName) {
$EmailTo = "marianne.durandt@unitrans.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_U002.pdf"
if (Test-Path $FileName) {
$EmailTo = "creditors@universalequipment.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_V001.pdf"
if (Test-Path $FileName) {
$EmailTo = "ttt@kingsley.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_W008.pdf"
if (Test-Path $FileName) {
$EmailTo = "hfontein@telkomsa.net"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_Z001.pdf"
if (Test-Path $FileName) {
$EmailTo = "accounts@znltransport.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}start-sleep -seconds 5
$filename = "C:\drs\statements\$folder\StatementE_202409_Z003.pdf"
if (Test-Path $FileName) {
$EmailTo = "znb@vodamail.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}

start-sleep -seconds 5
$EmailTo = "dianne@truckworldparts.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = "Statments sent. OK. "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath =
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)

start-sleep -seconds 5
$filename = "C:\drs\statements\date.txt"
if (Test-Path $FileName) {
$EmailTo = "henry@networkassociates.co.za"
$EmailFrom = "dianne@truckworldparts.co.za"
$Subject = Get-Content C:\drs\statements\Email.txt
$Body = " "
$SMTPServer = "mail.truckworldparts.co.za"
$filenameAndPath = $filename
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$attachment = New-Object System.Net.Mail.Attachment($filenameAndPath)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("dianne@truckworldparts.co.za", "yw8-NFo^sHa]");
$SMTPClient.Send($SMTPMessage)
}
else
{
    # Do nothing
}





exit