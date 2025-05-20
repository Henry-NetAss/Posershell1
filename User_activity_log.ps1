$adsi = [ADSI]"WinNT://$env:COMPUTERNAME"

$adsi.Children | where {$_.SchemaClassName -eq 'user'} | ForEach-Object {
    
    $lastLogin = $_.LastLogin
    $username = $_.Name
    $displayname = $

    if ($lastLogin -ne $null) {
        try {
            $parsedDate = [DateTime]::ParseExact($lastLogin, 'MM/dd/yyyy HH:mm:ss', [System.Globalization.CultureInfo]::InvariantCulture)
            "$username,$($parsedDate.ToString('dd/MM/yyyy'))"
        } catch {
            # Handle invalid dates if needed
            ""
        }
    } else {
        "$username,No Last Login"
    }
} | Where-Object { $_ -ne "" } 


