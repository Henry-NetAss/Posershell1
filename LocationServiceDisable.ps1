Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Value "Deny"
Stop-Service -Name "lfsvc" -Force
Set-Service -Name "lfsvc" -StartupType "Disabled"
