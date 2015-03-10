$SQLServer = GBGUTL001
$SQLDatabase = MDT
$SQLInstance = MDT
Import-Module -Name d:\Powershell\MDTDB.psm1
Connect-MDTDatabase -sqlServer GBGUTL001 -database MDT -instance MDT
New-MDTComputer -description "P1097" -serialNumber CND1234567 -settings @{OSINSTALL="YES";OSDComputername="P1097"}