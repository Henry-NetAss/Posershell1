﻿Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\AnimateMinMax" -Name DefaultApplied -Value "0"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ComboBoxAnimation" -Name DefaultApplied -Value "0"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ControlAnimations" -Name DefaultApplied -Value "0"
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sMonDecimalSep -Value "."
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sMonThousandSep -Value ","
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sShortDate -Value "dd/MM/yyyy"
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sLongDate -Value "dddd, dd MMMM yyyy,"
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sThousand -Value ","
