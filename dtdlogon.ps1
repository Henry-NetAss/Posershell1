$path = "C:\Na\2024"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}
set-location c:\NA\2024
invoke-webrequest -Uri 'https://github.com/Henry-NetAss/logon-screen/archive/refs/heads/main.zip' -outfile 'C:\na\2024\logon.zip'
expand-archive -path C:\na\2024\logon.zip -destinationpath C:\NA\Installation
get-childitem 'C:\na\installation\logon-screen-main'|move-item -destination 'C:\na\Installation'
sleep-start -seconds 20
Remove-Item -LiteralPath "C:\NA\Installation\longon-screen-main" -Force -Recurse
Remove-Item -LiteralPath "C:\NA\2024" -Force -Recurse
set-location C:\NA\Installation
.\dtdlogonscreen.ps1
exit