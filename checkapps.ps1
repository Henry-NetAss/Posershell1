# Anydesk
$anydeskExePath = "C:\Program Files (x86)\AnyDesk\AnyDesk.exe"

if (Test-Path $anydeskExePath) {
    Write-Host "AnyDesk is installed."
} else {
    write-host "Anydesk is not installed"
    Write-Output y|winget install --id anydesk.anydesk
}

# ESET
$EsetExePath = "C:\Program Files\ESET\ESET Security\ecmds.exe"

if (Test-Path $EsetExePath) {
    Write-Host "Eset is installed."
} else {
    Write-Host "Eset is not installed"
    Write-Output y|winget install --id ESET.EndpointSecurity --silent
}

# Chrome

$ChromeExePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

if (Test-Path $ChromeExePath) {
    Write-Host "Chrome is installed."
} else {
    $Chromeexepath1 = "$env:USERPROFILE\AppData\Local\Google\Chrome\Application\chrome.exe"

    if (test-path $chromeexepath1) {
        write-host "Chrome is installed"
    } else { write-host "Chrome is not inistalled"
            write-output y|winget install --id Google.Chrome.EXE --silent
        }
    }

# TS Print

$TSPrintExePath = "C:\Program Files (x86)\TerminalWorks\TSPrint\showoptions.exe"

if (Test-Path $TSPrintExePath) {
    Write-Host "TS Print is installed."
} else {
    write-host "TS Print is not installed"
    set-location c:\na\installation
    $source = "https://www.terminalworks.com/downloads/tsprint/TSPrint_client.exe"
$destination = "$workdir\TSprint.exe"
Invoke-WebRequest $source -OutFile $destination
.\tsprint.exe /silent
}

# Adobe

$AdobeExePath = "C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe"

if (Test-Path $AdobeExePath) {
    Write-Host "Adobe is installed."

} else { write-host "Adobe is not inistalled"
Write-Output y|winget install --id Adobe.Acrobat.Reader.32-bit --silent
}

# Office 365

$OfficeExePath = "C:\Program Files\Microsoft Office\root\Office16\winword.exe"

if (Test-Path $OfficeExePath) {
    Write-Host "Office 365 is installed."

} else { write-host "Office 365 is not inistalled"
Write-Output y|winget install --id Microsoft.Office --silent
}
