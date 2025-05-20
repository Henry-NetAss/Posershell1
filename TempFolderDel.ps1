$users = Get-ChildItem C:\Users
foreach ($user in $users){
$folder = "$($user.fullname)\AppData\Local\temp"
   If (Test-Path $folder) {
     Get-ChildItem -Path $folder -Include * | remove-Item -recurse -ErrorAction SilentlyContinue
   }
}
Get-ChildItem -Path C:\Temp -Include *.* -File -Recurse | foreach { $_.Delete()}
Get-ChildItem -Path C:\Windows\Temp -Include *.* -File -Recurse | foreach { $_.Delete()}
