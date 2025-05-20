@echo offf
net user david aaa
timeout 5
Rundll32.exe user32.dll,LockWorkStation
exit