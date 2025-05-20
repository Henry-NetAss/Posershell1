# Check the registry for applications that start with "Voicemeeter"
$applicationName = "Voicemeeter"
$registryPaths = @(
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*",
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
)

$installed = $false

foreach ($path in $registryPaths) {
    $apps = Get-ItemProperty -Path $path | Where-Object { $_.DisplayName -like "$applicationName*" }
    if ($apps) {
        $installed = $true
        Write-Host "Application '$($apps.DisplayName)' is installed, device not currently compatible with Windows 11 24H2 Upgrade."
    }
}

if (-not $installed) {
    Write-Host "No application called '$applicationName' is installed, device is compatible with Windows 11 24H2 Upgrade."
}
