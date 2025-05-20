$path = "C:\Na\Installation\Recovery"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}
$FileName = "$env:COMPUTERNAME - $(get-date -f yyyy-MM-dd_HHmmss).jpg"
$File = "$Path\$FileName"
Add-Type -AssemblyName System.Windows.Forms
Add-type -AssemblyName System.Drawing
$Screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
$Width = $Screen.Width
$Height = $Screen.Height
$Left = $Screen.Left
$Top = $Screen.Top
$bitmap = New-Object System.Drawing.Bitmap $Width, $Height
$graphic = [System.Drawing.Graphics]::FromImage($bitmap)
$graphic.CopyFromScreen($Left, $Top, 0, 0, $bitmap.Size)
$bitmap.Save($File) 
