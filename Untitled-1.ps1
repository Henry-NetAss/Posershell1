systeminfo | Select-String "Registered Owner","System Boot Time"|Out-File C:\NA\Uptime.txt
add-content -path c:\Na\Uptime.txt -value ""
