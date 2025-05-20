$action = New-ScheduledTaskAction -Execute 'C:\NA\Installation\screenshot.exe'
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 5)
$principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "screen" -Description "5 minutes." -Principal $principal