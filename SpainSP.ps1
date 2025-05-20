$ShortcutTarget= "https://himoinsa.sharepoint.com/sites/HIMOINSASOUTHAFRICA/Documentos compartidos/Forms/AllItems.aspx"
$ShortcutFile = "c:\na\spainsp.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $ShortcutTarget
$Shortcut.IconLocation = "c:\na\spainsp.lnk"
$Shortcut.Save()