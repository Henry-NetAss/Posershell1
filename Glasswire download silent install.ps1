New-Item -ItemType Directory -Force -Path C:\NA\Installation
# Path for the workdir
$workdir = "c:\na\installation\"

# Download the installer

$source = "https://download.glasswire.com/GlassWireSetup.exe"
$destination = "$workdir\GlassWireSetup.exe"
Invoke-WebRequest $source -OutFile $destination
Start-Sleep -Seconds 15
Start-Process -FilePath "$workdir\GlassWireSetup.exe" /S -NoNewWindow -Wait -PassThru