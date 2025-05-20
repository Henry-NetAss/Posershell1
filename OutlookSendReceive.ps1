reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\EAS"
Start-sleep -seconds 5
New-ItemProperty -Path "HKCU:\Software\Microsoft\Office\16.0\Outlook\EAS" -Name "PushDuration" -PropertyType "DWORD" -value "7"