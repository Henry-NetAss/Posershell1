@echo off

sfc /scannow
echo y|chkdsk /f

exit