$age = read-host "Enter age"
if ($age -lt 18) {
	Write-Host "you are under 18"
}	Elseif ($age -lt 55) {
	Write-Host "you are under 55"
}	Elseif ($age -lt 55) {
	Write-Host "you are under .OLD"
}	else {
	Write-Host "You are ancient"
}