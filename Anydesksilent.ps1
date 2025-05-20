﻿New-Item -ItemType Directory -Force -Path C:\NA\Installation
$workdir = "c:\na\installation\"
$source = "https://download.anydesk.com/AnyDesk.exe"
$destination = "$workdir\AnyDesk.exe"
Invoke-WebRequest $source -OutFile $destination
cd C:\NA\Installation
.\AnyDesk.exe --install "C:\Program Files (x86)\AnyDesk" --start-with-win --create-shortcuts --create-desktop-icon --silent
Start-Sleep -Seconds 15
$NewPassword = 'Supp0rt@NA123'
Invoke-Command -ScriptBlock {
    Param($NewPassword)
    $Expression = 'echo {0} | "C:\Program Files (x86)\AnyDesk\AnyDesk.exe" --set-password' -f $NewPassword
    Start-Process cmd.exe -ArgumentList "/c $Expression"
} -ArgumentList $NewPassword

Start-Sleep -Seconds 30

$strLoggedOnUser = $env:USERPROFILE
$strAnyDeskConf = "\appdata\roaming\AnyDesk\system.conf"
$strAnyDeskId = ""
$strAnyDeskConf2 = "\programdata\AnyDesk\system.conf"
$strAnyDeskId2 = ""
      
$strAnyDeskId = (Get-Content ($strLoggedOnUser + "\" + $strAnyDeskConf) | Select-String -Pattern "ad.anynet.id").ToString().Trim() -replace "ad.anynet.id="
$strAnyDeskId2 = (Get-Content ($env:SystemDrive + $strAnyDeskConf2) | Select-String -Pattern "ad.anynet.id").ToString().Trim() -replace "ad.anynet.id="

