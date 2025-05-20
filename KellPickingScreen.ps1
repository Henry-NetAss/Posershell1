 $pathToChrome = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$tempFolder = '--user-data-dir=c:\temp' # pick a temp folder for user data
$startmode = '--start-fullscreen' # '--kiosk' is another option
$startPage1 = 'http://app.kell.co.za/current'
$startPage2 = 'http://app.kell.co.za/backorder'
$startPage3 = 'http://app.kell.co.za/future-date'

Start-Process -FilePath $pathToChrome ('--new-window',  '--start-fullscreen', '--user-data-dir=c:/screen1','--window-position=0,0', $startPage1) -ErrorVariable Test 
Start-Process -FilePath $pathToChrome ('--new-window',  '--start-fullscreen', '--user-data-dir=c:/screen2','--window-position=1366,0', $startPage2) -ErrorVariable Test 
Start-Process -FilePath $pathToChrome ('--new-window',  '--start-fullscreen', '--user-data-dir=c:/screen3','--window-position=3286,0', $startPage3) -ErrorVariable Test 