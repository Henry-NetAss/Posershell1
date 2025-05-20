$message = 'We recommend that you take a backup before running this script, it will delete ALL Sage files, INCLUDING Company Data'
$question = 'Are you sure you want to proceed?'
$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
$decision = $Host.UI.PromptForChoice($message, $question, $choices, 1)
if ($decision -eq 0) {
Write-Host 'confirmed'
} else {
Write-Host 'Uninstallation Cancelled'
exit
}
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "Stopping Sage Services"
Stop-Service *Sage*
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "Removing System DSNs"
Write-Host "Checking for and removing; OBDC 64-Bit SageLine50v18"
Remove-OdbcDsn -Name "SageLine50v18" -DsnType "System" -Platform 64-bit -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Write-Host "Checking for and removing; OBDC 64-Bit SageLine50v19"
Remove-OdbcDsn -Name "SageLine50v19" -DsnType "System" -Platform 64-bit -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Write-Host "Checking for and removing; OBDC 64-Bit SageLine50v20"
Remove-OdbcDsn -Name "SageLine50v20" -DsnType "System" -Platform 64-bit -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Write-Host "Checking for and removing; OBDC 64-Bit SageLine50v21"
Remove-OdbcDsn -Name "SageLine50v21" -DsnType "System" -Platform 64-bit -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Write-Host "Checking for and removing; OBDC 64-Bit SageLine50v22"
Remove-OdbcDsn -Name "SageLine50v22" -DsnType "System" -Platform 64-bit -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Write-Host "Checking for and removing; OBDC 64-Bit SageLine50v23"
Remove-OdbcDsn -Name "SageLine50v23" -DsnType "System" -Platform 64-bit -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Write-Host "Checking for and removing; OBDC 64-Bit SageLine50v24"
Remove-OdbcDsn -Name "SageLine50v24" -DsnType "System" -Platform 64-bit -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Write-Host "All 64-Bit ODBC Entries have been removed"
Write-Host "Checking for and removing; OBDC 32-Bit SageLine50v18"
Remove-OdbcDsn -Name "SageLine50v18" -DsnType "System" -Platform 32-bit -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Write-Host "Checking for and removing; OBDC 32-Bit SageLine50v19"
Remove-OdbcDsn -Name "SageLine50v19" -DsnType "System" -Platform 32-bit -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Write-Host "Checking for and removing; OBDC 32-Bit SageLine50v20"
Remove-OdbcDsn -Name "SageLine50v20" -DsnType "System" -Platform 32-bit -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Write-Host "Checking for and removing; OBDC 32-Bit SageLine50v21"
Remove-OdbcDsn -Name "SageLine50v21" -DsnType "System" -Platform 32-bit -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Write-Host "Checking for and removing; OBDC 32-Bit SageLine50v22"
Remove-OdbcDsn -Name "SageLine50v22" -DsnType "System" -Platform 32-bit -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Write-Host "Checking for and removing; OBDC 32-Bit SageLine50v23"
Remove-OdbcDsn -Name "SageLine50v23" -DsnType "System" -Platform 32-bit -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Write-Host "Checking for and removing; OBDC 32-Bit SageLine50v24"
Remove-OdbcDsn -Name "SageLine50v24" -DsnType "System" -Platform 32-bit -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Write-Host "All 32-Bit ODBC Entries have been removed"
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "....."
#
#
#### Uninstall Sage Accounts Program #####
#
#
#
Write-Host "Uninstalling Sage Software with their uninstallers"
$app = Get-WmiObject -Class Win32_Product | Where-Object {$_.Vendor -Like "Sage (UK) Ltd"}
$Name = $app.name
foreach ($a in $app){$app.Uninstall()
Write-Host "Uninstalling $a.Name"
}
#
#
#
#### Remove Sage Program Files and content #####
#
#
Write-Host "Removing Files from C:\Program Files"
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "....."
Remove-Item "C:\Program Files\Sage\Accounts" -Force -Recurse -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Remove-Item "C:\Program Files (x86)\Sage\Accounts" -Force -Recurse -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Remove-Item "C:\Program Files\Common Files\Sage SBD" -Force -Recurse -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Remove-Item "C:\Program Files\Common Files\Sage Line50" -Force -Recurse -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Remove-Item "C:\Program Files\Common Files\Sage Report Designer 2007" -Force -Recurse -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Remove-Item "C:\Program Files\Common Files\Sage Shared" -Force -Recurse -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Remove-Item "C:\Program Files\Sage EBanking" -Force -Recurse -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Remove-Item "C:\Program Files (x86)\Sage\Assemblies" -Force -Recurse -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
#
#
##### Get a list of Sage DLL Files from GAC and Uninstall with Regsvr32 #####
#
#
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "Removeing Files in GAC"
Get-ChildItem -Path C:\Windows\Assembly\GAC -Recurse -Include Sage* -ErrorAction SilentlyContinue | foreach ($_) {Remove-Item $_.FullName -Recurse -Confirm:$true}
Get-ChildItem -Path C:\Windows\Assembly\GAC_32 -Recurse -Include Sage* -ErrorAction SilentlyContinue | foreach ($_) {Remove-Item $_.FullName -Recurse -Confirm:$true}
Get-ChildItem -Path C:\Windows\Assembly\GAC_MSIL -Recurse -Include Sage* -ErrorAction SilentlyContinue | foreach ($_) {Remove-Item $_.FullName -Recurse -Confirm:$true}
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "....."
#
#
##### Delete Sage DLL's from SYSWOW64 (64-Bit) #####
#
#
Write-Host "Removing files from SYSWOW64"
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "....."
Get-ChildItem -Path C:\Windows\SysWOW64\ -Recurse -Include sdoEng*.*, S23DBC32.dll, sg50SdoEngine230.dll, S22DBC32.dll, sg50SdoEngine220.dll, S21DBC32.dll, sg50SdoEngine210.dll, S20DBC32.dll, sg50SdoEngine200.dll, S19DBC32.dll, sg50SdoEngine190.dll, S18DBC32.dll, sg50SdoEngine180.dll, S17DBC32.dll, sg50sdoengine170.dll -ErrorAction SilentlyContinue | foreach ($_) {Remove-item $_.FullName} -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
#
#
##### Delete Sage Dll's from System32 (32-Bit) #####
#
#
Write-Host "Removing Files from System32"
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "....."
Get-ChildItem -Path "C:\Windows\System32\" -Include sdoEng*.*, S23DBC32.dll, sg50SdoEngine230.dll, S22DBC32.dll, sg50SdoEngine220.dll, S21DBC32.dll, sg50SdoEngine210.dll, S20DBC32.dll, sg50SdoEngine200.dll, S19DBC32.dll, sg50SdoEngine190.dll, S18DBC32.dll, sg50SdoEngine180.dll, S17DBC32.dll, sg50sdoengine170.dll, S24DBC32.DLL -ErrorAction SilentlyContinue | foreach ($_) {Remove-item $_.FullName} -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
#
#
##### Delete other Sage files and DLL's from System32 #####
#
#
Write-Host "Removing more files from System32"
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "....."
Get-ChildItem -Path "C:\Windows\System32\" -Include RepDes32.exe, repdes.cnt, SageBankBalances.tlb, SageBankPayments.tlb, SageBankReconciliation.tlb, SageEventHandler.Config, SageEventHandler.exe, SageFolderBrowser.dll, SG3D32.DLL, sg50Ps32.dll, SGAPPBAR.DLL, SGCDLG32.DLL, SGCOM32.DLL, SGCtrlEx.dll, SGDT32.DLL, SgESchema.xsd, SGHELP32.DLL, SgHmZLib.dll, SGINTL32.DLL, SGJPEG32.dll, SGLCH32.DLL, SGLCH32.USR, SGLIST32.DLL, SGLOGO32.DLL, SGOEdit.ocx, SGOList.ocx, SGOPopDg.dll, sgopopup.ocx, SGOSize.ocx, SGOTBar.ocx, SGRegister.dll, SGRegister.tlb, SGRep32.dll, SGSchemeDefault.dll, SGSchemeManager.dll, SGSchemeXml.dll, SGSchemeXP.dll, SGSTAT32.DLL, SGSTDREG.dll, SGStdReg.tlb, SGTBAR32.DLL, SGTOOL32.DLL, SGWebBrowser.dll -ErrorAction SilentlyContinue | foreach ($_) {Remove-item $_.FullName} -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
#
#
##### Delete other Sage files and DLL's from SYSWOW64 #####
#
#
#
#get-childitem 'C:\My Web Sites\' -recurse -Include Pass* | foreach ($_) {Remove-item $_.Attributes.Equals(Sage*)}
Write-Host "Removing User Temp Files"
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "....."
Remove-Item "C:\Users\$env:Username\AppData\Local\Temp" -Force -Recurse -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Write-Host "Removing Program Data Files"
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "....."
Remove-Item "C:\ProgramData\Sage" -Force -Recurse -ErrorAction SilentlyContinue | Out-File .\Sage-Removal.txt -Append
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "Sage has been uninstalled"
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "Removing Sage Installer from Package Cache location"
$Uni = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall |
Get-ItemProperty |
Where-Object {$_.DisplayName -match "Sage 50 Accounts" } |
Select-Object -Property DisplayName, UninstallString
ForEach ($ver in $Uni) {
If ($Uni.UninstallString) {
$uninst = $ver.UninstallString
Start-Process cmd -ArgumentList "/c $uninst /quiet /norestart" -NoNewWindow
}
}
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "....."
Write-Host "Please now manually check Programs and Features in Control Panel and remove any leftover installers"

[amazon_link asins=’1118848055,1119214157,184078721X’ template=’ProductGrid’ store=’412294wp-21′ marketplace=’UK’ link_id=’9531da43-695c-11e8-a847-79822557fdd4′]