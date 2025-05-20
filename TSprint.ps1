# Silent install Adobe Reader DC
# https://get.adobe.com/nl/reader/enterprise/

# Path for the workdir
$workdir = "c:\NA\Installation\"

# Check if work directory exists if not create it

If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "$workdir already exists" -ForegroundColor Red}
ELSE
{ New-Item -Path $workdir  -ItemType directory }

# Download the installer

$source = "https://www.terminalworks.com/downloads/tsprint/TSPrint_client.exe"
$destination = "$workdir\TSprint.exe"
Invoke-WebRequest $source -OutFile $destination
