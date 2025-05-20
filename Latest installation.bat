@echo off
powershell -command "& {Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force}"
cd c:\NA\Installation
powershell.exe c:\na\Installation\UAC_Disable.ps1
powershell.exe c:\na\installation\Region_Settings.ps1
tzutil /s "South Africa Standard Time"
timeout 5
powershell.exe c:\na\installation\software.ps1
timeout 60
tv.exe /S
zoom.exe /silent
klite.exe /silent
openjdk8.msi /quiet
openjdk11.msi /quiet
chrome.exe /silent /install
eset.msi /quiet
powershell.exe c:\na\installation\O365BR.ps1
powershell.exe c:\na\installation\Anydesksilent.ps1
nettime.exe /silent
tsprint.exe /silent
timeout 15
start https://naera.networkassociates.co.za/era/webconsole
start https://nasupport.networkassociates.co.za
timeout 10
chrome-outlook.vbs
timeout 60
powershell.exe c:\na\installation\remove_printers.ps1
powershell.exe c:\na\installation\updates.ps1
exit