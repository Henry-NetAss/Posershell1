$path = "C:\Na"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}
(New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path|set-location
Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-30))} | Remove-Item -Recurse -Force

















$path | get-content "C:\na\downloads.txt"
 -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-30))} | Remove-Item -Recurse -Force
Clear-RecycleBin -Force