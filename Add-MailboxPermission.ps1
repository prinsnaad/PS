$Project = Read-Host "Uppdragsnummer"
$UserName = Read-Host "Användarnamn"

Add-MailboxPermission $Project -User $UserNAme -AccessRights Fullaccess -InheritanceType all
