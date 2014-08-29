#Find and copy
$Destination = Read-Host "Destination path"
$files = Get-ChildItem -path C:\Users\ -include "*.pst" -Recurse -Force
foreach ($file in $files) {
	Copy-Item -path $file.FullName -Destination "$destination"
}