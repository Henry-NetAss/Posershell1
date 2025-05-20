systeminfo|out-file -FilePath c:\NA\Info.txt
write-host "User"|[System.Environment]::UserName|Out-File -FilePath C:\NA\info.txt -append
write-host "test"|Out-file -FilePath c:\NA\info.txt -append 