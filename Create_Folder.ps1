$mappnamn = Read-Host = "Vad ska katalogen heta?"
New-Item -ItemType directory -Path c:\$mappnamn > $null
New-Item -ItemType directory -path c:\$mappnamn\Filer > $null
New-Item -ItemType directory -path c:\$mappnamn\Mappar > $null