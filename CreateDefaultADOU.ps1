$company = Read-Host "What is the company name?"
$domain = Read-Host "What is the domain name? Enter as DC=domain,DC=local"
import-module ActiveDirectory
New-ADOrganizationalUnit -Name "Common"
New-ADOrganizationalUnit -Name "$Company"
NEW-ADOrganizationalUnit “Admins” –path “OU=Common,$domain” > $null
NEW-ADOrganizationalUnit “Consultants” –path “OU=Common,$domain” > $null
NEW-ADOrganizationalUnit “Service” –path “OU=Common,$domain” > $null
NEW-ADOrganizationalUnit “Security” –path “OU=Common,$domain” > $null
NEW-ADOrganizationalUnit “Distribution” –path “OU=Common,$domain” > $null
NEW-ADOrganizationalUnit “Users” –path “OU=$company,$domain” > $null
NEW-ADOrganizationalUnit “Clients” –path “OU=$company,$domain” > $null
NEW-ADOrganizationalUnit “Servers” –path “OU=$company,$domain” > $null
redircmp "OU=Clients,OU=$company,$domain" > $null
redirusr "OU=Users,OU=$company,$domain" > $null