# Path for the workdir
$workdir = "%temp%"

# Download the installer

$source = "https://ninite.com/adoptjava8-adoptjavax11-adoptjavax8-chrome-klitecodecs-teamviewer15-zoom/ninite.exe"
$destination = "$workdir\Ninite.exe"
Invoke-WebRequest $source -OutFile $destination

# Download the installer

$source = "https://www.terminalworks.com/downloads/tsprint/TSPrint_client.exe"
$destination = "$workdir\TSprint.exe"
Invoke-WebRequest $source -OutFile $destination

# Download the installer

$source = "https://www.timesynctool.com/NetTimeSetup-314.exe"
$destination = "$workdir\Nettime.exe"
Invoke-WebRequest $source -OutFile $destination

# Download the installer

$source = "https://download.eset.com/com/eset/apps/business/ees/windows/latest/ees_nt64.msi"
$destination = "$workdir\ESET.msi"
Invoke-WebRequest $source -OutFile $destination

# Download the installer

$source = "https://download.anydesk.com/AnyDesk.msi"
$destination = "$workdir\AnyDesk.msi"
Invoke-WebRequest $source -OutFile $destination

# Download the installer

$source = "http://ardownload.adobe.com/pub/adobe/reader/win/AcrobatDC/1502320053/AcroRdrDC1502320053_en_US.exe"
$destination = "$workdir\PDF.exe"
Invoke-WebRequest $source -OutFile $destination

Start-Process -FilePath "$workdir\pdf.exe" -ArgumentList "/sPB /rs"