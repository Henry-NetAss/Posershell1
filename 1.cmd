REM Silently uninstall McAfee Security Scan (tested with 3.8)
REM and prevent future installations

REM Detect processor architecture
set proc_arch=x64
if "%PROCESSOR_ARCHITECTURE%" == "x86" ( 
    if not defined PROCESSOR_ARCHITEW6432 set proc_arch=x86
) 

REM Define McAfee Security Scan path
if "%proc_arch%" == "x86" set McAfeePath=%ProgramFiles%\McAfee Security Scan
if "%proc_arch%" == "x64" set McAfeePath=%ProgramFiles(x86)%\McAfee Security Scan
set McAfeeReadme=%McAfeePath%\..\McAfee_ReadMe.txt
set McAfeeRevert=%McAfeePath%\..\McAfee_RestorePermissions.cmd

REM Define McAfee Security Scan path
if "%proc_arch%" == "x86" set McAfeePath=%ProgramFiles%\McAfee
if "%proc_arch%" == "x64" set McAfeePath=%ProgramFiles(x86)%\McAfee
set McAfeeReadme=%McAfeePath%\..\McAfee_ReadMe.txt
set McAfeeRevert=%McAfeePath%\..\McAfee_RestorePermissions.cmd

REM Uninstall McAfee Security Scan
if exist "%McAfeePath%\uninstall.exe" start "" /wait "%McAfeePath%\uninstall.exe" /s /inner

REM Create dummy McAfee Security Scan folder
md "%McAfeePath%"

REM Add explanatory text file, as to why the dummy folder is there
echo The 'McAfee Security Scan' folder is has been created and write protected,> "%McAfeeReadme%"
echo in order to prevent McAfee Security Scan from being 'accidentally'>> "%McAfeeReadme%"
echo installed, e.g. by Adobe Reader.>> "%McAfeePath%\readme.txt">> "%McAfeeReadme%"
echo.>> "%McAfeeReadme%"
echo This has been done using ICACLS by denying write access to the>> "%McAfeeReadme%"
echo EVERYONE security group.>> "%McAfeeReadme%"
echo.>> "%McAfeeReadme%"
echo To revert permissions run:>> "%McAfeeReadme%"
echo %McAfeeRevert%>> "%McAfeeReadme%"

REM Create script to remove restrictions
echo icacls "%McAfeePath%" /remove:d *S-1-1-0> "%McAfeeRevert%"

REM Deny everyone (SID: S-1-1-0) write access
icacls "%McAfeePath%" /deny *S-1-1-0:(OI)(CI)W