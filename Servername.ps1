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