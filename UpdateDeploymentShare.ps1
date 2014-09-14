$share = read-host "Available:
LIN - Östergötland
ORE - Mälardalen
KSD - Karlstad
ENG - Engineering
GBG - Väst
OSL - Norge
JKP - Mälardalen
AEC - AEC Testserver
SUN - Mitt
BOR - Mitt och Bro
All - Update all shares.
Select one to update"
Import-Module "C:\Program Files\Microsoft Deployment Toolkit\bin\MicrosoftDeploymentToolkit.psd1"
New-PSDrive -Name "DS001" -PSProvider MDTProvider -Root "E:\DeploymentShare"
if ($share -eq "LIN") {
	Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED001" -Verbose
}	Elseif ($share -eq "ORE") {
	Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED002" -Verbose
}	Elseif ($share -eq "KSD") {
	Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED003" -Verbose
}	Elseif ($share -eq "ENG") {
	Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED004" -Verbose
}	Elseif ($share -eq "GBG") {
	Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED005" -Verbose
}	Elseif ($share -eq "OSL") {
	Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED006" -Verbose
}	Elseif ($share -eq "JKP") {
	Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED007" -Verbose
}	Elseif ($share -eq "AEC") {
	Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED008" -Verbose
}	Elseif ($share -eq "SUN") {
	Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED009" -Verbose
}	Elseif ($share -eq "BOR") {
	Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED010" -Verbose
}	Elseif ($share -eq "ALL") {
	Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED001" -Verbose
    Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED002" -Verbose
    Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED003" -Verbose
    Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED004" -Verbose
    Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED005" -Verbose
    Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED006" -Verbose
    Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED007" -Verbose
    Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED008" -Verbose
    Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED009" -Verbose
    Update-MDTLinkedDS -path "DS001:\Linked Deployment Shares\LINKED010" -Verbose
}else {
	Write-Host "Verify your share name"
}


$emailSmtpServer = "smtp.office365.com"
$emailSmtpServerPort = "587"
$emailSmtpUser = "printer@eqcgroup.se"
$emailSmtpPass = "cig$!3mA1J%P"
 
$emailMessage = New-Object System.Net.Mail.MailMessage
$emailMessage.From = "printer@eqcgroup.se"
$emailMessage.To.Add( "naad@aec.se" )
$emailMessage.Subject = "EQC MDT"
$emailMessage.IsBodyHtml = $true
$emailMessage.Body = @"
<p>Update <strong>Complete!</strong>.</p>
<p>From BHFUS01</p>
"@
 
$SMTPClient = New-Object System.Net.Mail.SmtpClient( $emailSmtpServer , $emailSmtpServerPort )
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential( $emailSmtpUser , $emailSmtpPass );
 
$SMTPClient.Send( $emailMessage )