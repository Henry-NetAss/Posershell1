$Computer = $env:COMPUTERNAME
$Users = query user /server:$Computer 2>&1

$Users = $Users | ForEach-Object {
    (($_.trim() -replace ">" -replace "(?m)^([A-Za-z0-9]{3,})\s+(\d{1,2}\s+\w+)", '$1  none  $2' -replace "\s{2,}", "," -replace "none", $null))
} | ConvertFrom-Csv

foreach ($User in $Users)
{
    [PSCustomObject]@{
        ComputerName = $Computer
        Username = $User.USERNAME
        SessionState = $User.STATE.Replace("Disc", "Disconnected")
        SessionType = $($User.SESSIONNAME -Replace '#', '' -Replace "[0-9]+", "")
    } 
}