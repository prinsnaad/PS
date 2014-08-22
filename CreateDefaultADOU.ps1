$company = Read-Host "Vhat is the company name?"
$domain = Read-Host "What is the domain name? Enter as DC=domain,DC=local"
New-ADOrganizationalUnit -Name "Common"
New-ADOrganizationalUnit -Name "$Company"
NEW-ADOrganizationalUnit “Admins” –path “OU=Common,$domain”
NEW-ADOrganizationalUnit “Consultants” –path “OU=Common,$domain”
NEW-ADOrganizationalUnit “Service” –path “OU=Common,$domain”
NEW-ADOrganizationalUnit “Security” –path “OU=Common,$domain”
NEW-ADOrganizationalUnit “Distribution” –path “OU=Common,$domain”
NEW-ADOrganizationalUnit “Users” –path “$company,$domain”
NEW-ADOrganizationalUnit “Clients” –path “$company,$domain”
NEW-ADOrganizationalUnit “Servers” –path “$company,$domain”