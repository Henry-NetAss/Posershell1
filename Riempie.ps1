function OPERA-PendingReboot 
{
 if (Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending" -EA Ignore) { return $true } 
 if (Get-Item "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired" -EA Ignore) { return $true } 
 if (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" -Name PendingFileRenameOperations -EA Ignore) { return $true } 
 try 
    { $util = [wmiclass]"\\.\root\ccm\clientsdk:CCM_ClientUtilities"
     $status = $util.DetermineIfRebootPending() 
     if(($status -ne $null) -and $status.RebootPending){ return $true 
    } 
    }catch{} 
return $false
 } $host_name=hostname 
 if(OPERA-PendingReboot -eq $true)
 { Write-Host "`n`nTRUE - for $host_name Reboot is Pending, please complete a reboot before activity schedule`n`n" -ForegroundColor Red 
} else {Write-Host "`n`nFALSE - There is no Pending Reboot for $host_name your system is ready for the activity`n`n" -ForegroundColor green }