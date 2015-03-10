$users = Import-Csv C:\ps\users.csv
foreach ($user in $users){
Try
{
   $Account = Get-ADUser -Identity $user.samaccountname
}
Catch
{
    $test = $user.samaccountname
    Add-Content C:\ps\missing.txt  "$test does not exist"
}
}