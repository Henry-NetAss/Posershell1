<#
.SYNOPSIS
	Tests system uptime for days switched one then triggers and action
.DESCRIPTION
	Tests system uptime for days switched one then triggers and action
    Adapted from Old script from Donovan that tested uptime via an remote computer to a list of computer names
.NOTES
	Created by Donovan Vosloo
    2023-02-02
#>
$computers = @("localhost") #list of computers
foreach ($computer in $computers) {
    $wmi = ""
    if (Test-Connection $computer -Quiet){
        $wmi = Get-WmiObject -Class win32_OperatingSystem -ComputerName $computer
        if (($wmi.ConvertToDateTime($wmi.LocalDateTime) – $wmi.ConvertToDateTime($wmi.LastBootUpTime)).Days -ge 7){
            write-host "Computer was on for 3 days or more"
            msg * "This PC needs a restart as it has been active for 7 or more days.
                   Security patches need to be applied.

You have 5 minutes to save any open and unsaved Work."
            shutdown.exe /g /t 300 /f
            

        }
    }
}