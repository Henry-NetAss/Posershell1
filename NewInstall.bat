::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyG0UFDRaSSCQNX2/Rvhc7Pru5uSIo1ghcOcsc5vUyoi+L/MW+FbscJohlklZisIcGAhkXxyyagonon1LumGLI4mMoF6B
::fBE1pAF6MU+EWHreyG0UFDRaSSCQNX2/Rvhc7Pru5uSIo1ghcOcsc5vUyoi+L/MW+FbscJohlklZisIcGAhkUUH9Oy0G535R5wQ=
::fBE1pAF6MU+EWHreyG0UFDRaSSCQNX2/Rvhc7Pru5uSIo1ghcOcsc5vUyoi+L/MW+FbscJohlklZisIcGAhkTBesZwA6ll1HonCMOcCP/R/yGyg=
::fBE1pAF6MU+EWHreyG0UFDRaSSCQNX2/Rvhc7Pru5uSIo1ghcOcsc5vUyoi+L/MW+FbscJohlklZisIcGAhkTBemYRkxln5Qv2qRMtWP/R/yGyg=
::fBE1pAF6MU+EWHreyG0UFDRaSSCQNX2/Rvhc7Pru5uSIo1ghcOcsc5vUyoi+L/MW+FbscJohlklZisIcGAhkSwKvbxsxuiBSpTXl
::fBE1pAF6MU+EWHreyGwRFDJaXxCDMGe7ErwT5tTo4OyT+xxNBrJtKsHLyeXu
::fBE1pAF6MU+EWHreyG0UFDRaSSCQNX2/Rvhc7Pru5uSIo1ghcOcsc5vUyoi+L/MW+FbscJohlklZisIcGAhkSzOIUSs9um9AumHLJ9TN0w==
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJHelyGs+Ow9VQAiDKGK1CIkI7fvvr+OJtEQOXeAzfcHewrHu
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
powershell -command "& {Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force}"
cd c:\NA\Installation
powershell.exe c:\na\Installation\UAC_Disable.ps1
powershell.exe c:\na\installation\Region_Settings.ps1
tzutil /s "South Africa Standard Time"
timeout 5
powershell.exe c:\na\installation\software.ps1
timeout 5
tv.exe /S
zoom.exe /silent
klite.exe /silent
openjdk8.msi /quiet
openjdk11.msi /quiet
chrome.exe /silent /install
eset.msi /quiet
powershell.exe c:\na\installation\O365BR.ps1
powershell.exe c:\na\installation\Anydesksilent.ps1
nettime.exe /silent
tsprint.exe /silent
powershell.exe c:\na\installation\remove_printers.ps1
powershell.exe c:\na\installation\updates.ps1
exit