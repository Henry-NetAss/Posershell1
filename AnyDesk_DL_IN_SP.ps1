#AnyDesk Downloader and Silent Installer by Donovan Vosloo

#Create Directory to download AnyDesk into
mkdir c:\nainstall
#Acesses Website and downloads the latest AnyDesk Program
Invoke-WebRequest -Uri https://download.anydesk.com/AnyDesk.exe -OutFile c:\nainstall\anydesk.exe
#Runs the AnyDesk installer silently and places Icon on desktop and starts it with Windows
c:\nainstall\AnyDesk.exe --install "C:\Support Software\AnyDesk" --start-with-win --silent --create-shortcuts --create-desktop-icon
