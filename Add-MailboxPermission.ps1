$Project = Read-Host "Uppdragsnummer"
$UserName = Read-Host "Anv�ndarnamn"

Add-MailboxPermission $Project -User $UserNAme -AccessRights Fullaccess -InheritanceType all
