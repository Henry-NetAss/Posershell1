# Set variables
$DownloadPath = "C:\NA\Installation"
$Link = "https://www.nirsoft.net/utils/chromehistoryview.zip"
$File = "chromehistoryview.zip"
$InstallFile = "ChromeHistoryView.exe"

# Download
$ProgressPreference = "SilentlyContinue"
if (Test-Path $DownloadPath\$File) {
  Remove-Item $DownloadPath\$File
}
Invoke-WebRequest -Uri $Link -OutFile $DownloadPath\$File -UseBasicParsing

# Extract
if (Test-Path $DownloadPath\$InstallFile) {
  Remove-Item $DownloadPath\$InstallFile
}
Expand-Archive $DownloadPath\$File $DownloadPath

# Install to UpdatePath
Start-Process -FilePath "$DownloadPath\$InstallFile" -ArgumentList "/UseHistoryFile 1","/HistoryFile `"C:\Users\Odette\AppData\Local\Google\Chrome\User Data\Default\History`"","/scomma c:\NA\ChromeHistoryView.csv"