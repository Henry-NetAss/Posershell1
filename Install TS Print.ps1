<#
.SYNOPSIS
	Installs the Chrome browser
.DESCRIPTION
	This PowerShell script installs the latest Google Chrome Web browser.
.EXAMPLE
	PS> ./install-chrome-browser
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz / License: CC0
#>

try {
	$StopWatch = [system.diagnostics.stopwatch]::startNew()

	$Path += $env:TEMP;
	$Installer = "Teamviewer.exe"
	Invoke-WebRequest "https://download.teamviewer.com/download/TeamViewer_Setup_x64.exe" -OutFile $Path\$Installer
	Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -wait
	

	[int]$Elapsed = $StopWatch.Elapsed.TotalSeconds
	"✔️ installed Program in $Elapsed sec"
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}