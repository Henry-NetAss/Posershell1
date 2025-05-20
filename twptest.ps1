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
$lb.Text = 'Please type Year and Month. EXAMPLE - 202406'
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
$progressForm.Width = 350
$progressForm.Height = 200
$progressForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$progressForm.Text = "Sending Statements"
$progressForm.StartPosition = 'CenterScreen'
 
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(10, 50)
$progressBar.Size = New-Object System.Drawing.Size(280, 200)
$progressForm.Controls.Add($progressBar)
 
$progressLabel = New-Object System.Windows.Forms.Label
$progressLabel.Location = New-Object System.Drawing.Point(10, 20)
$progressLabel.Size = New-Object System.Drawing.Size(260, 200)
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
    Start-Sleep -Milliseconds 70
    $index++
}
 
$progressForm.Close()

#Folder location

$folder = get-content C:\drs\statements\Date.txt
set-location c:\drs\statements\$folder
$filename = "C:\drs\statements\$folder\StatementE_202406_A007.pdf"
if (Test-Path $FileName) {
$outlook = new-object -comobject outlook.application

$email = $outlook.CreateItem(0)
$email.To = "henry@networkassociates.co.za"
$email.Subject = Get-Content C:\drs\statements\Email.txt
$email.Body = " " 
$email.Attachments.add($filename)

$email.Send()
}
else
{
    # Do nothing
}start-sleep -seconds 5
Add-Type -AssemblyName System.Windows.Forms
 
$progressForm = New-Object System.Windows.Forms.Form
$progressForm.Width = 350
$progressForm.Height = 150
$progressForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$progressForm.Text = "Sending Statements"
$progressForm.StartPosition = 'CenterScreen'
 
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(10, 50)
$progressBar.Size = New-Object System.Drawing.Size(280, 20)
$progressForm.Controls.Add($progressBar)
 
$progressLabel = New-Object System.Windows.Forms.Label
$progressLabel.Location = New-Object System.Drawing.Point(10, 20)
$progressLabel.Size = New-Object System.Drawing.Size(260, 200)
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
    $progressLabel.Text = "test"
    Start-Sleep -Milliseconds 700
    $index++
}
 
$progressForm.Close()

$folder = get-content C:\drs\statements\Date.txt
set-location c:\drs\statements\$folder
$filename = "C:\drs\statements\$folder\StatementE_202406_A007.pdf"
if (Test-Path $FileName) {
$outlook = new-object -comobject outlook.application

$email = $outlook.CreateItem(0)
$email.To = "henry.cloete1111@outlook.com"
$email.Subject = Get-Content C:\drs\statements\Email.txt
$email.Body = " " 
$email.Attachments.add($filename)

$email.Send()
}
else
{
    # Do nothing
}start-sleep -seconds 5




exit