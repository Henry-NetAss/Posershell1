$blockUrlList = @("www.facebook.com", "www.instagram.com", "www.tiktok.com", "www.youtube.com", "www.dstv.com", "https://dstv.stream", "www.netflix.com", "https://moviebox.ng/", "https://www.justwatch.com") 


$defaultHostsFile = @"

"@

try
{
    $originalhostsFile= Get-Content C:\Windows\System32\drivers\etc\hosts -ErrorAction Ignore
    $hostFileExists = $true
    if(-not($originalhostsFile))
    {
        $hostFileExists = $false
        $originalhostsFile = $defaultHostsFile
    }
    $updatedHostsFile = $originalhostsFile
    ForEach($url in $blockUrlList)
    {
        if($hostFileExists)
        {
            $updatedHostsFile = $updatedHostsFile+"127.0.0.1 $url"
        }
        else
        {
            $updatedHostsFile = $updatedHostsFile+"`n127.0.0.1 $url"
        }

    }
    $updatedHostsFile | Out-File -FilePath C:\Windows\System32\drivers\etc\hosts -Encoding utf8 -Force
    Write-Host "updated Hosts file->"
    $updatedHostsFile
}
catch
{
    Write-Host $_.Exception.Message
}