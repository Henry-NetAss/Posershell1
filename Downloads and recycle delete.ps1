Get-ChildItem –Path "C:\Users\*\Downloads\*" -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-30))} | Remove-Item
Clear-RecycleBin -Force