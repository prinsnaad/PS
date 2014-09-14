$CSV = "C:\users.csv"
$Users = Import-Csv $CSV

Foreach ($User in $Users)
{
Set-ADUser $user.SamAccountName -office $user.Office -Surname $user.Efternamn
}