
$Key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP'
if (!(Test-Path -Path $Key)) {
   New-Item -Path $Key -Force | Out-Null
}
Set-ItemProperty -Path $Key -Name LockScreenImagePath -value "C:\na\installation\envirologon.jpg"