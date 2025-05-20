$onedriveProcess = Get-Process -Name "OneDrive" -ErrorAction SilentlyContinue

if ($null -eq $onedriveProcess) {
    Start-Process -FilePath "C:\Program Files\Microsoft OneDrive\OneDrive.exe" -ArgumentList "/signin"
    Write-Host "OneDrive has been started."
} 
else 
{
    Write-Host "OneDrive is already running."
}