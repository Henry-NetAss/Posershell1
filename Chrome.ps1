$path = "C:\Na\Installation"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}

Write-Host Downloading Stuff ....60%....
$source = "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B5BDB0487-C973-62F8-C2C9-4D5281D83E08%7D%26lang%3Den%26browser%3D3%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/chrome/install/ChromeStandaloneSetup64.exe"
$destination = "$workdir\Chrome.exe"
Invoke-WebRequest $source -OutFile $destination
