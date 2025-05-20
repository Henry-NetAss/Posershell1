$users = "Na-Admin","Henry-Na","administrator"
$group = "Administrator";
$groupObj =[ADSI]"WinNT://./$group,group" 
$membersObj = @($groupObj.psbase.Invoke("Members")) 

$members = ($membersObj | foreach {$_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null)})

ForEach ($user in $users) {
If ($members -contains $user) {
      Write-Host "$user exists in the group $group"
 } Else {
        Write-Host "$user does not exist in the group $group"
}}