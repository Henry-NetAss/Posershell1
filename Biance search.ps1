
Get-ChildItem -Path C:\ -Include *.xlsx* -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -ge $FindDate }