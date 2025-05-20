
@echo off
powershell -command "& {Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force}"
cd C:\
mkdir C:\NA\Installation
mkdir C:\NA\Tasks
cd c:\NA\Installation
powershell.exe c:\na\Installation\UCA_Disable.ps1
timeout 5
powershell.exe c:\na\Installation\Updatesnoprolicense.ps1
timeout 5
powershell.exe c:\NA\Installation\Temosoemail.ps1
timeout 5
del C:\NA\Tasks\Updates.zip
rmdir /s /q c:\AutoUpdates
exit