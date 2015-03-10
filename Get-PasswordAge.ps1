$age = [DateTime]::FromFileTime((Get-ADUser -Identity naadadmin -Properties *).pwdLastSet)
$today = get-date
$TotalAge = New-TimeSpan -Start $age -End $today
if ($TotalAge.Days -gt 90) {
write-host = "Password is too old!"
}
else {
write-host = Chill Bae
}