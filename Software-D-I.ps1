New-Item -ItemType Directory -Force -Path C:\NA\Installation
$workdir = "c:\na\installation\"
# Ninite
$source = "https://ninite.com/adoptjava8-adoptjavax11-adoptjavax8-chrome-klitecodecs-teamviewer15-zoom/ninite.exe"
$destination = "$workdir\Ninite.exe"
Invoke-WebRequest $source -OutFile $destination
.\Ninite.exe
# TSprint
$source = "https://www.terminalworks.com/downloads/tsprint/TSPrint_client.exe"
$destination = "$workdir\TSprint.exe"
Invoke-WebRequest $source -OutFile $destination
.\tsprint.exe /silent
# NetTime
$source = "https://www.timesynctool.com/NetTimeSetup-314.exe"
$destination = "$workdir\Nettime.exe"
Invoke-WebRequest $source -OutFile $destination
.\nettime.exe /silent
# ESET
$source = "https://download.eset.com/com/eset/apps/business/ees/windows/latest/ees_nt64.msi"
$destination = "$workdir\ESET.msi"
Invoke-WebRequest $source -OutFile $destination
# Anydesk
$source = "https://download.anydesk.com/AnyDesk.exe"
$destination = "$workdir\AnyDesk.exe"
Invoke-WebRequest $source -OutFile $destination
cd C:\NA\Installation
.\AnyDesk.exe --install "C:\Program Files (x86)\AnyDesk" --start-with-win --create-shortcuts --create-desktop-icon --silent
Start-Sleep -Seconds 15
$NewPassword = 'Supp0rt@123'
Invoke-Command -ScriptBlock {
    Param($NewPassword)
    $Expression = 'echo {0} | "C:\Program Files (x86)\AnyDesk\AnyDesk.exe" --set-password' -f $NewPassword
    Start-Process cmd.exe -ArgumentList "/c $Expression"
} -ArgumentList $NewPassword
# Adobe
$source = "http://ardownload.adobe.com/pub/adobe/reader/win/AcrobatDC/1502320053/AcroRdrDC1502320053_en_US.exe"
$destination = "$workdir\PDF.exe"
Invoke-WebRequest $source -OutFile $destination
Start-Process -FilePath "$workdir\pdf.exe" -ArgumentList "/sPB /rs"
Start-Process cmd.exe
tsprint.exe /silent
nettime.exe /silent
nettime.exe
eset.msi /quiet