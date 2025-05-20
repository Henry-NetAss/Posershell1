net user NA-Admin Supp0rt@NA123 /add 
Start-Sleep -seconds 10
Add-LocalGroupMember -Group Administrators -Member Na-Admin
net user Na-Admin -passwordneverexpires $true