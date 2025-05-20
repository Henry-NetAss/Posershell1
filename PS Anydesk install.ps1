# Create folders
cd c:\
mkdir NA\Installation
# Path for the workdir
$workdir = "c:\na\installation\"
# Download the installer
$source = "https://download.anydesk.com/AnyDesk.exe"
$destination = "$workdir\AnyDesk.exe"
Invoke-WebRequest $source -OutFile $destination
Start-Sleep -Seconds 60
# Install Anydesk
cd C:\NA\Installation
.\AnyDesk.exe --install "C:\Program Files (x86)\AnyDesk" --start-with-win --create-shortcuts --create-desktop-icon --silent --get-id
Start-Sleep -Seconds 15
$NewPassword = 'Supp0rt@123'
Invoke-Command -ScriptBlock {
    Param($NewPassword)
    $Expression = 'echo {0} | "C:\Program Files (x86)\AnyDesk\AnyDesk.exe" --set-password' -f $NewPassword
    Start-Process cmd.exe -ArgumentList "/c $Expression"
} -ArgumentList $NewPassword

