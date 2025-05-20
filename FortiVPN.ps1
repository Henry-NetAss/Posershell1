$path = "C:\Na\Installation"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}
$workdir = "c:\na\installation\"
$source = "https://github.com/Henry-NetAss/forticlient/archive/refs/heads/main.zip"
$destination = "$workdir\Forti.zip"
Invoke-WebRequest $source -OutFile $destination
Expand-Archive -Path $workdir\Forti.zip -DestinationPath C:\NA\Forti
set-location "C:\Na\Forti\forticlient-main"
.\Forticlientvpnonlineinstaller.exe /q