

Stop-Process -name "Onedrive" -Force
set-location "HKCU:"
Remove-Item -Path HKCU:\Software\Microsoft\OneDrive\Accounts\Business3 -Recurse
$sp = Get-ItemPropertyValue -path 'HKCU:\Software\Microsoft\OneDrive\Accounts\Business1' 'DisplayName' |Out-file c:\na\sp.txt
