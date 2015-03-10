Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

Import-Module ADDSDeployment;   

$credentials = Get-Credential         
            
Install-ADDSDomainController -NoGlobalCatalog:$false -CreateDnsDelegation:$false -CriticalReplicationOnly:$false -DatabasePath "C:\Windows\NTDS" -DomainName "eqc.local" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$true -ReplicationSourceDC "bhfdc01.eqc.local" -SiteName "Default-First-Site-Name" -SysvolPath "C:\Windows\SYSVOL" -Force:$true -Credential $credentials -Confirm:$false -SafeModeAdministratorPassword (ConvertTo-SecureString 'rock@F1' -AsPlainText -Force)  