Get-ADUser -Filter * -Properties *|out-file "c:\na\userpriv.txt"
start-sleep -seconds 5
Get-Content -Path "C:\na\userpriv.txt" | Select-String -Pattern "givenname", "memberof","samaccountname"|out-file "c:\na\$($env:computername).txt"
get-content "c:\na\$($env:computername).txt"