$company = Read-Host "What is the company name?"
$domain = Get-ADDomain | select -ExpandProperty DistinguishedName
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
redirusr “ou=Users,OU=$company,$domain”
redircmp "ou=Clients,OU=$company,$domain”