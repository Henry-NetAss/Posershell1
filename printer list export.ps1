$env:USERPROFILE
Get-Printer | Format-Table Name,DriverName,PortName|Out-file -filepath c:\NA\Printer.txt
