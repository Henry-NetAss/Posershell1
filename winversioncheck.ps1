#Check Windows OS version
(Get-WmiObject -class Win32_OperatingSystem).Caption
#check what version of windows is installed
(Get-Item "HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion").GetValue('DisplayVersion')
