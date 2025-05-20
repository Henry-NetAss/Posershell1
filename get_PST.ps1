#Get the current date and time, computer name, user name and path to share where to save the list of PST files found
$date_time = Get-Date -Format yyyy-MM-dd_HH-mm-ss
$computername = $env:COMPUTERNAME
$sharepath = "C:\NA\"
$username = $env:USERNAME
 
#Test if Outlook is running. Script should only run when Outlook is running. Otherwise a pop-up appears on the user's screen...
try {
    $proc = Get-Process -Name OUTLOOK -ErrorAction Stop
 
    #Get the version of Office
    $prodver = $proc.ProductVersion
}
catch {
    "$date_time;$computername;Outlook is not running;N/A;N/A;$username" | Out-File -FilePath ("$sharepath\$computername" + "_PST_files.csv") -Append
    break
}
 
#Load Outlook object from current user's profile
$Outlook = New-Object -ComObject 'Outlook.Application' -ErrorAction 'Stop'
 
#Get all Outlook stores of type 3 (PST)
$pstobjects = $outlook.GetNameSpace('MAPI').Stores | Where-Object {$_.ExchangeStoreType -eq 3}
if ($pstobjects -eq $null) {
    "$date_time;$computername;No PST files found;N/A;$prodver;$username" | Out-File -FilePath ("$sharepath\$computername" + "_PST_files.csv") -Append
    break
}
 
#For each PST file found...
foreach ($pstobject in $pstobjects) {
    #get the PST file path
    $filepath = $pstobject.filepath
 
    #Remove invalid characters from from file path
    if ($filepath -match ":") {
        $drive = (Split-Path $filepath -Qualifier).Replace(':','')
        $leaf = Split-Path $filepath -NoQualifier
        $unc = Join-Path (Get-PSDrive $drive)[0].DisplayRoot -ChildPath $leaf
        $filepathcleaned = $unc
    } else {
        $filepathcleaned = $pstobject.filepath -replace [regex]::escape('?\UNC\'),''
    }
    
    #If the file exists, get the size and output data to a CSV file. The name includes the computer name.
    if (test-path $filepathcleaned) {
        $filesize = (Get-Item $filepathcleaned).length
        "$date_time;$computername;$filepathcleaned;$filesize;$prodver;$username" | Out-File -FilePath ("$sharepath\$computername" + "_PST_files.csv") -Append
    }
}