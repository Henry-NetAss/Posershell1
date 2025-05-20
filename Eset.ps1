$workdir = "c:\na\installation\"

$source = "https://download.eset.com/com/eset/apps/business/ees/windows/latest/ees_nt64.msi"
$destination = "$workdir\ESET.msi"
Invoke-WebRequest $source -OutFile $destination
