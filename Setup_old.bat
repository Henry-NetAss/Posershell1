cd c:\NA\Installation
powercfg -change -monitor-timeout-ac 0
powercfg -change -standby-timeout-ac 0
powercfg -change -hibernate-timeout-ac 0
powershell -command "& {Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force}"
powershell.exe c:\na\installation\website.ps1
powershell.exe C:\NA\Installation\UAC_Disable.ps1
powershell.exe C:\NA\Installation\DarkMode.ps1
powershell.exe C:\NA\Installation\Region_Settings.ps1
powershell.exe C:\NA\Installation\Disable_Fast_Boot.ps1
tzutil /s "South Africa Standard Time"
powershell.exe C:\NA\Installation\software.ps1
echo Installing Stuff
powershell.exe C:\NA\Installation\Install-Microsoft365.ps1
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
powershell.exe C:\NA\Installation\NIC_Power_Management.ps1
timeout 10
cls
powershell.exe C:\NA\Installation\updates.ps1
exit
