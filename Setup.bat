@echo off
cd c:\NA\Installation
powershell.exe c:\na\installation\Region_Settings.ps1
tzutil /s "South Africa Standard Time"
timeout 5
timeout 60
tv.exe /S
timeout 15
zoom.exe /silent
timeout 15
klite.exe /silent
timeout 5
nettime.exe /silent
timeout 15
powershell.exe c:\NA\Installation\Disable_Fast_Boot.ps1
timeout 60
powershell.exe c:\na\installation\remove_printers.ps1
powershell.exe c:\na\installation\updates.ps1
exit