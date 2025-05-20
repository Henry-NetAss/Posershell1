
(Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorBasicDisplayParams | Where-Object {$_.Active -like "True"}).Active.Count| Out-File -FilePath c:\NA\screens.txt
$Status = Get-Content C:\Na\screens.txt

If ($Status -eq 0) 
{
  get-process -name Chrome | stop-process
}
elseif ($Status -eq 1)
{

  get-process -name Chrome | stop-process
}
elseif ($Status -eq 2)
{

  get-process -name Chrome | stop-process
}
elseif ($Status -eq 3)
{if (!(Get-Process -ProcessName chrome -ErrorAction SilentlyContinue)) {
}

  C:\na\kell.exe
}