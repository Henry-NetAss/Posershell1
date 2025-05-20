cd c:\NA\Installation
powershell -command "& {Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force}"
powershell.exe C:\NA\Installation\UAC_Disable.ps1
powershell.exe C:\NA\Installation\DarkMode.ps1
powershell.exe C:\NA\Installation\Region_Settings.ps1
powershell.exe C:\NA\Installation\Disable_Fast_Boot.ps1
tzutil /s "South Africa Standard Time"
Powershell.exe C:\na\Installation\RequestPCName.ps1
cls
Powershell.exe C:\NA\Installation\PCName.ps1
powershell.exe C:\NA\Installation\software.ps1
echo Installing Stuff
powershell.exe C:\NA\Installation\O365BR.ps1
timeout 5
cls
powershell -command "& {Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force}"
powershell.exe c:\na\Installation\Desktop_Shortcuts.ps1
timeout 5
cls
echo Installing Stuff
powershell -command "& {Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force}"
powershell.exe C:\NA\Installation\Anydesksilent.ps1
timeout 5
cls
powershell.exe C:\NA\Installation\remove_printers.ps1
cls
powershell.exe C:\NA\Installation\updates.ps1
exit
