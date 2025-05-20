$INSTALLED = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName, DisplayVersion, Publisher, InstallDate, InstallLocation
$INSTALLED += Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate, InstallLocation
$INSTALLED | ?{ $_.DisplayName -ne $null } | sort-object -Property DisplayName -Unique | Format-Table DisplayName,InstallDate,Publisher |Out-File C:\NA\Apps.txt

###### Keyword check for Bloatware ######

$p = @("Avast","Mcafee","Norton","Ccleaner","Mailware","Opera","AVG","Windows PC Health Check","defraggler","rainmeter")
Get-Content "C:\NA\Apps.txt" | Select-String -Pattern $p -SimpleMatch | Set-Content C:\NA\Bloatware.txt