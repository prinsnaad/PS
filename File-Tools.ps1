function New-ProjectFolder {
[CmdletBinding()]
param(
    [Parameter(Mandatory=$True)]
    [string]$ProjectNr,
    
    [Parameter()]
    [string]$Description
)
BEGIN{

}
PROCESS{
    
    New-Item -Path (Join-Path -Path \\aec.local\data\uppdrag\uppdrag15 -ChildPath $ProjectNr) -ItemType directory -Force | Out-Null
   
    New-Item -Path (Join-Path -Path \\aec.local\data\uppdrag\uppdrag15 -ChildPath $ProjectNr\desktop.ini) -ItemType File -Force

    Set-Content -Path (Join-Path -Path \\aec.local\data\uppdrag\uppdrag15 -ChildPath $ProjectNr\desktop.ini) -Value "[.ShellClassInfo]
LocalizedResourceName=$ProjectNr - $Description
IconResource=%SystemRoot%\system32\imageres.dll,-162
FolderType=Documents
DefaultDropEffect=1"

    Set-ItemProperty (Join-Path -Path \\aec.local\data\uppdrag\uppdrag15 -ChildPath $ProjectNr) -Name Attributes -Value ([System.IO.FileAttributes]::System)
}
END{}
}

function New-ProjectMailbox {
[CmdletBinding()]
param(
    [Parameter(Mandatory=$True)]
    [string]$ProjectNr,
    
    [Parameter(Mandatory=$True)]
    [string]$DisplayName,
    
    [Parameter(Mandatory=$True)]
    [string[]]$Users,

    [Parameter()]
    [string]$ExchangeServer = "gbgexc001.aec.local"

)
BEGIN{
    
    #$PSSession = New-PSSession -ComputerName GBGEXC001.aec.local -Name Exchange
    $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://$ExchangeServer/PowerShell/ -Authentication Kerberos
    Import-PSSession $Session
    #Add-PSSnapin Microsoft.Exchange.Management.PowerShell.E2010

}
PROCESS{

    New-Mailbox -UserPrincipalName $ProjectNr@aec.local -Alias $ProjectNr -Name $ProjectNr -Database 'AEC Uppdrag' -OrganizationalUnit 'aec.local/Common/Users/Resource' -Shared -ResetPasswordOnNextLogon $true -DisplayName $DisplayName
    
    foreach ($User in $Users){
    Add-MailboxPermission $ProjectNr -User $User -AccessRights Fullaccess -InheritanceType all
    }
}
END{

    Remove-PSSession $Session

}
}