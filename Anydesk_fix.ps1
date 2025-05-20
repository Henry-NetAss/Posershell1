$path = "C:\Na\Anydesk"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}
set-location "$env:USERPROFILE\appdata\roaming\anydesk"
copy-item "$env:USERPROFILE\appdata\roaming\anydesk\user.conf" -Destination "C:\NA"
$anyDeskPath = "C:\Program Files (x86)\AnyDesk\AnyDesk.exe"
if (Test-Path $anyDeskPath) {
$silentRemoveCommand = "$anyDeskPath --silent --remove"
try {
Start-Process -FilePath $anyDeskPath -ArgumentList "--silent", "--remove" -Wait -NoNewWindow
} catch {
Write-Error "An error occurred during the silent removal: $_"
}
} else {
Write-Host "AnyDesk is not installed or not found at $anyDeskPath."
}
Remove-Item -Path "$env:ProgramData\AnyDesk" -Recurse -Force
Remove-Item -Path "$env:USERPROFILE\appdata\Roaming\AnyDesk" -Recurse -Force
New-Item -ItemType Directory -Force -Path C:\NA\Anydesk
$workdir = "c:\na\Anydesk\"
$source = "https://download.anydesk.com/AnyDesk.exe"
$destination = "$workdir\AnyDesk.exe"
Invoke-WebRequest $source -OutFile $destination
set-location "C:\NA\Anydesk"
.\AnyDesk.exe --install "C:\Program Files (x86)\AnyDesk" --start-with-win --create-shortcuts --create-desktop-icon --silent
Start-Sleep -Seconds 15
$NewPassword = 'Supp0rt@NA123'
Invoke-Command -ScriptBlock {
    Param($NewPassword)
    $Expression = 'echo {0} | "C:\Program Files (x86)\AnyDesk\AnyDesk.exe" --set-password' -f $NewPassword
    Start-Process cmd.exe -ArgumentList "/c $Expression"
} -ArgumentList $NewPassword
copy-item "C:\NA\user.conf" -Destination "$env:USERPROFILE\appdata\roaming\anydesk"