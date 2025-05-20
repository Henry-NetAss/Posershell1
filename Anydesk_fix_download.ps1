$path = "C:\Na\2024"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}
set-location c:\NA\2024
invoke-webrequest -Uri 'https://github.com/Henry-NetAss/Anydesk/archive/refs/heads/main.zip' -outfile 'C:\na\2024\Anydesk.zip'
expand-archive -path C:\na\2024\Anydesk.zip -destinationpath C:\NA\Anydesk
get-childitem 'C:\na\Anydesk\Anydesk-main'|move-item -destination 'C:\na\Anydesk'
Remove-Item -LiteralPath "C:\NA\Anydesk\Anydesk-main" -Force -Recurse
Remove-Item -LiteralPath "C:\NA\2024" -Force -Recurse
set-location C:\NA\Anydesk
.\anydesk_fix_setup.bat
exit
