function Set-DefaultBrowser
{
    param($defaultBrowser)

    $regKey      = "HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\{0}\UserChoice"
    $regKeyFtp   = $regKey -f 'ftp'
    $regKeyHttp  = $regKey -f 'http'
    $regKeyHttps = $regKey -f 'https'

    switch -Regex ($defaultBrowser.ToLower())
    {
        # Internet Explorer
        'ie|internet|explorer' {
            Set-ItemProperty $regKeyFtp   -name ProgId IE.FTP
            Set-ItemProperty $regKeyHttp  -name ProgId IE.HTTP
            Set-ItemProperty $regKeyHttps -name ProgId IE.HTTPS
            break
        }
        # Firefox
        'ff|firefox' {
            Set-ItemProperty $regKeyFtp   -name ProgId FirefoxURL
            Set-ItemProperty $regKeyHttp  -name ProgId FirefoxURL
            Set-ItemProperty $regKeyHttps -name ProgId FirefoxURL
            break
        }
        # Google Chrome
        'cr|google|chrome' {
            Set-ItemProperty $regKeyFtp   -name ProgId ChromeHTML
            Set-ItemProperty $regKeyHttp  -name ProgId ChromeHTML
            Set-ItemProperty $regKeyHttps -name ProgId ChromeHTML
            break
        }
        # Safari
        'sa*|apple' {
            Set-ItemProperty $regKeyFtp   -name ProgId SafariURL
            Set-ItemProperty $regKeyHttp  -name ProgId SafariURL
            Set-ItemProperty $regKeyHttps -name ProgId SafariURL
            break
        }
        # Opera
        'op*' {
            Set-ItemProperty $regKeyFtp   -name ProgId Opera.Protocol
            Set-ItemProperty $regKeyHttp  -name ProgId Opera.Protocol
            Set-ItemProperty $regKeyHttps -name ProgId Opera.Protocol
            break
        }
    } 

}