$action = New-ScheduledTaskAction -Execute 'C:\NA\Installation\Screenshot.exe'
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 1)
$principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Screen" -Description "1 minutes." -Principal $principal
$Principal = New-ScheduledTaskPrincipal -UserID "$env:USERDOMAIN\$env:USERNAME" -LogonType ServiceAccount -RunLevel Highest