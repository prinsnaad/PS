clsswitch -wildcard ($servername) {
	"GBG*" { "Server is in Göteborg" }
	"STH*" { "Server is in Stockholm" }
	"*FIL*" { "Server is a filserver" }	
	"*EXC*" { "Server is an Exchangeserver" }	
	"*DOM*" { "Server is a Domaincontroller" }
	"*UTL*" { "Server is an Utilityserver" }
	"*DIR*" { "Server is a DirSync server" }
}