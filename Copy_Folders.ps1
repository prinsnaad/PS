# NAAD

$id = Read-Host "User ID?"
$ServerName = Read-Host "Server Name?"
Copy-Item -path "\\$ServerName\temp\$id\*" -Destination "C:\användare\$id\" -Force -Recurse -verbose