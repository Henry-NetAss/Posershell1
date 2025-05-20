#Remove search from taskbar
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name 'SearchboxTaskbarMode' -Value 0 -PropertyType DWord -Force
#Remove TaskView button from taskbar
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name 'ShowTaskViewButton' -Value 0 -PropertyType DWord -Force
#Remove frequetly used Folders
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name 'ShowFrequent' -Value 0 -PropertyType DWord -Force

#Install ESET Endpoint Security
winget install --id ESET.EndpointSecurity --silent
#winget install whatsapp
winget install --id 9NKSQGP7F2NH --silent
#Install adobe acrobat reader dc
winget install --id Adobe.Acrobat.Reader.32-bit --silent
#Install JDK 11
winget install --id EclipseAdoptium.Temurin.11.JDK --silent
#Install JDK 8
winget install --id EclipseAdoptium.Temurin.8.JDK --silent
#Install Google Chrome
winget install --id Google.Chrome.EXE --silent
#Install Anydesk
winget install --name AnyDesk --silent
#Install Teamviewer
winget install --id TeamViewer.TeamViewer --silent
#Install Nettime
winget install --name NetTime --silent
#Install Microsoft 365
winget install --id Microsoft.Office --verbose

Set-ItemProperty -Path HKCU:\software\microsoft\windows\currentversion\explorer\advanced -Name 'TaskbarAl' -Type 'DWord' -Value 0

function Create-Shortcut {
    param (
        [string]$TargetPath,
        [string]$ShortcutPath
    )

$WshShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut($ShortcutPath)
    $Shortcut.TargetPath = $TargetPath
    $Shortcut.Save()
}

# Replace the following paths with the appropriate ones for your system
$ThisPCPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Excel.lnk"


# Create shortcuts for each item
Create-Shortcut -TargetPath "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -ShortcutPath $ThisPCPath


# Pin shortcuts to the taskbar
$shell = New-Object -ComObject Shell.Application
$taskbarPath = [System.IO.Path]::Combine([Environment]::GetFolderPath('ApplicationData'), 'Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar')

$shell.Namespace($taskbarPath).Self.InvokeVerb('pindirectory', $ThisPCPath)

