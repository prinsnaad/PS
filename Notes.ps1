Constructs

$i = Read-Host "Boop"
do	{
	#Something or the other
	$i++
} 	while ( $i -lt 10 )

$i = 15
do	{
	#Something or the other
	$i++
} 	until ( $i -gt 10 )

$i = Read-Host "Boop"
do	{
	#Something or the other
	$i++
} 	while ( $i -lt 10 )

for ($i=0;$i -lt 10; $i++) {
	#code goes here
}

$ access content
$x = 5
remove-variable -name $x
remove-variable -name x
${lol detta fungerar} = :D:D
help about_variables

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
help about_if* -showwindow

#för varje service gör ett kommando
$services = get-services
foreach ($service in $services) {
	$x.name
}

get-service | foreach-Object { $_.name }

#alla steg utförs
switch ($status) {
	0 = { $real_status = 'Printer OK' }
	1 = { $real_status = 'Printer Jammed' }
	2 = { $real_status = 'Printer Out of Paper' }
	default { $real_status = 'Printer Unknown' }	
}

#Alla steg kontrolleras och det som är True visas.
$servername = Read-Host "Vad heter servern?"
switch -wildcard ($servername) {
	"GBG*" { "Server is in Göteborg" }
	"STH*" { "Server is in Stockholm" }
	"MLM*" { "Server is in Malmö"; break }
	"*FIL*" { "Server is a filserver" }	
	"*EXC*" { "Server is an Exchangeserver" }	
	"*DOM*" { "Server is a Domaincontroller" }
	"*UTL*" { "Server is an Utilityserver" }
	"*DIR*" { "Server is a DirSync server" }
}
help about_Switch





