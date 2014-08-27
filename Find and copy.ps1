#Find and copy

$files = Get-ChildItem -path e:\test\folder1 -include "*.txt" -Recurse
foreach ($file in $files) {
	Copy-Item -path $file.FullName -Destination e:\test\folder2\
}