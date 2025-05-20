for ($i = 0; $i -le 50000000; $i++) {
  Write-Host "Iteration $i"
  # Place the script's content or function call here

$path = "C:\Na\Installation\Recovery"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}
$FileName = "$(get-date -f HHmmss).jpg"
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
}