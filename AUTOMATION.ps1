New-Item -ItemType Directory -Force -Path C:\NA\Installation
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sCurrency -Value "R"
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sDecimal -Value "."
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sList -Value ","
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sMonDecimalSep -Value "."
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sMonThousandSep -Value ","
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sShortDate -Value "dd/MM/yyyy"
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sLongDate -Value "dddd, dd MMMM yyyy,"
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sThousand -Value ","
# Path for the workdir
$workdir = "c:\na\installation\"

# Download the installer

$source = "https://ninite.com/adoptjava8-adoptjavax11-adoptjavax8-chrome-klitecodecs-teamviewer15-zoom/ninite.exe"
$destination = "$workdir\Ninite.exe"
Invoke-WebRequest $source -OutFile $destination

# Download the installer

$source = "https://www.terminalworks.com/downloads/tsprint/TSPrint_client.exe"
$destination = "$workdir\TSprint.exe"
Invoke-WebRequest $source -OutFile $destination

# Download the installer

$source = "https://www.timesynctool.com/NetTimeSetup-314.exe"
$destination = "$workdir\Nettime.exe"
Invoke-WebRequest $source -OutFile $destination

# Download the installer

$source = "https://download.eset.com/com/eset/apps/business/ees/windows/latest/ees_nt64.msi"
$destination = "$workdir\ESET.msi"
Invoke-WebRequest $source -OutFile $destination

# Download the installer
New-Item -ItemType Directory -Force -Path C:\NA\Installation
$workdir = "c:\na\installation\"
$source = "https://download.anydesk.com/AnyDesk.exe"
$destination = "$workdir\AnyDesk.exe"
Invoke-WebRequest $source -OutFile $destination
cd C:\NA\Installation
.\AnyDesk.exe --install "C:\Program Files (x86)\AnyDesk" --start-with-win --create-shortcuts --create-desktop-icon --silent
Start-Sleep -Seconds 15
$NewPassword = 'Supp0rt@123'
Invoke-Command -ScriptBlock {
    Param($NewPassword)
    $Expression = 'echo {0} | "C:\Program Files (x86)\AnyDesk\AnyDesk.exe" --set-password' -f $NewPassword
    Start-Process cmd.exe -ArgumentList "/c $Expression"
} -ArgumentList $NewPassword

# Download the installer

$source = "http://ardownload.adobe.com/pub/adobe/reader/win/AcrobatDC/1502320053/AcroRdrDC1502320053_en_US.exe"
$destination = "$workdir\PDF.exe"
Invoke-WebRequest $source -OutFile $destination

Start-Process -FilePath "$workdir\pdf.exe" -ArgumentList "/sPB /rs"

# Install Offic 365

[CmdletBinding(DefaultParameterSetName = 'XMLFile')]
param(
  [Parameter(ParameterSetName = 'XMLFile')][String]$ConfigurationXMLFile,
  [Parameter(ParameterSetName = 'NoXML')][ValidateSet('TRUE', 'FALSE')]$AcceptEULA = 'TRUE',
  [Parameter(ParameterSetName = 'NoXML')][ValidateSet('Broad', 'Targeted', 'Monthly')]$Channel = 'Broad',
  [Parameter(ParameterSetName = 'NoXML')][Switch]$DisplayInstall = $False,
  [Parameter(ParameterSetName = 'NoXML')][ValidateSet('Groove', 'Outlook', 'OneNote', 'Access', 'OneDrive', 'Publisher', 'Word', 'Excel', 'PowerPoint', 'Teams', 'Lync')][Array]$ExcludeApps,
  [Parameter(ParameterSetName = 'NoXML')][ValidateSet('64', '32')]$OfficeArch = '64',
  [Parameter(ParameterSetName = 'NoXML')][ValidateSet('O365ProPlusRetail', 'O365BusinessRetail')]$OfficeEdition = 'O365BusinessRetail',
  [Parameter(ParameterSetName = 'NoXML')][ValidateSet(0, 1)]$SharedComputerLicensing = '0',
  [Parameter(ParameterSetName = 'NoXML')][ValidateSet('TRUE', 'FALSE')]$EnableUpdates = 'TRUE',
  [Parameter(ParameterSetName = 'NoXML')][String]$LoggingPath,
  [Parameter(ParameterSetName = 'NoXML')][String]$SourcePath,
  [Parameter(ParameterSetName = 'NoXML')][ValidateSet('TRUE', 'FALSE')]$PinItemsToTaskbar = 'TRUE',
  [Parameter(ParameterSetName = 'NoXML')][Switch]$KeepMSI = $False,
  [String]$OfficeInstallDownloadPath = 'C:\NA\Installation',
  [Switch]$CleanUpInstallFiles = $False
)

function Set-XMLFile {

  if ($ExcludeApps) {
    $ExcludeApps | ForEach-Object {
      $ExcludeAppsString += "<ExcludeApp ID =`"$_`" />"
    }
  }

  if ($OfficeArch) {
    $OfficeArchString = "`"$OfficeArch`""
  }

  if ($KeepMSI) {
    $RemoveMSIString = $Null
  }
  else {
    $RemoveMSIString = '<RemoveMSI />'
  }

  if ($Channel) {
    $ChannelString = "Channel=`"$Channel`""
  }
  else {
    $ChannelString = $Null
  }

  if ($SourcePath) {
    $SourcePathString = "SourcePath=`"$SourcePath`"" 
  }
  else {
    $SourcePathString = $Null
  }

  if ($DisplayInstall) {
    $SilentInstallString = 'Full'
  }
  else {
    $SilentInstallString = 'None'
  }

  if ($LoggingPath) {
    $LoggingString = "<Logging Level=`"Standard`" Path=`"$LoggingPath`" />"
  }
  else {
    $LoggingString = $Null
  }

  $OfficeXML = [XML]@"
  <Configuration>
    <Add OfficeClientEdition=$OfficeArchString $ChannelString $SourcePathString  >
      <Product ID="$OfficeEdition">
        <Language ID="MatchOS" />
        $ExcludeAppsString
      </Product>
    </Add>  
    <Property Name="PinIconsToTaskbar" Value="$PinItemsToTaskbar" />
    <Property Name="SharedComputerLicensing" Value="$SharedComputerlicensing" />
    <Display Level="$SilentInstallString" AcceptEULA="$AcceptEULA" />
    <Updates Enabled="$EnableUpdates" />
    $RemoveMSIString
    $LoggingString
  </Configuration>
"@

  $OfficeXML.Save("$OfficeInstallDownloadPath\OfficeInstall.xml")
  
}
function Get-ODTURL {

  [String]$MSWebPage = Invoke-RestMethod 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=49117'

  $MSWebPage | ForEach-Object {
    if ($_ -match 'url=(https://.*officedeploymenttool.*\.exe)') {
      $matches[1]
    }
  }

}

$VerbosePreference = 'Continue'
$ErrorActionPreference = 'Stop'

$CurrentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (!($CurrentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))) {
  Write-Warning 'Script is not running as Administrator'
  Write-Warning 'Please rerun this script as Administrator.'
  exit
}

if (-Not(Test-Path $OfficeInstallDownloadPath )) {
  New-Item -Path $OfficeInstallDownloadPath -ItemType Directory | Out-Null
}

if (!($ConfigurationXMLFile)) {
  Set-XMLFile
  $ConfigurationXMLFile = "$OfficeInstallDownloadPath\OfficeInstall.xml"
}
else {
  if (!(Test-Path $ConfigurationXMLFile)) {
    Write-Warning 'The configuration XML file is not a valid file'
    Write-Warning 'Please check the path and try again'
    exit
  }
}

$ODTInstallLink = Get-ODTURL

#Download the Office Deployment Tool
Write-Verbose 'Downloading the Office Deployment Tool...'
try {
  Invoke-WebRequest -Uri $ODTInstallLink -OutFile "$OfficeInstallDownloadPath\ODTSetup.exe"
}
catch {
  Write-Warning 'There was an error downloading the Office Deployment Tool.'
  Write-Warning 'Please verify the below link is valid:'
  Write-Warning $ODTInstallLink
  exit
}

#Run the Office Deployment Tool setup
try {
  Write-Verbose 'Running the Office Deployment Tool...'
  Start-Process "$OfficeInstallDownloadPath\ODTSetup.exe" -ArgumentList "/quiet /extract:$OfficeInstallDownloadPath" -Wait
}
catch {
  Write-Warning 'Error running the Office Deployment Tool. The error is below:'
  Write-Warning $_
}

#Run the O365 install
try {
  Write-Verbose 'Downloading and installing Microsoft 365'
  $Silent = Start-Process "$OfficeInstallDownloadPath\Setup.exe" -ArgumentList "/configure $ConfigurationXMLFile" -Wait -PassThru
}
catch {
  Write-Warning 'Error running the Office install. The error is below:'
  Write-Warning $_
}

#Check if Office 365 suite was installed correctly.
$RegLocations = @('HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
  'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
)

$OfficeInstalled = $False
foreach ($Key in (Get-ChildItem $RegLocations) ) {
  if ($Key.GetValue('DisplayName') -like '*Microsoft 365*') {
    $OfficeVersionInstalled = $Key.GetValue('DisplayName')
    $OfficeInstalled = $True
  }
}

if ($OfficeInstalled) {
  Write-Verbose "$($OfficeVersionInstalled) installed successfully!"
}
else {
  Write-Warning 'Microsoft 365 was not detected after the install ran'
}

if ($CleanUpInstallFiles) {
  Remove-Item -Path $OfficeInstallDownloadPath -Force -Recurse
}
