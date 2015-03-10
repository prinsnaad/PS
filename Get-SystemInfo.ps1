<#
.SYNOPSIS
Gets computer information from local or remote machine.
.DESCRIPTION
Stuff n WMI ports open plx.
.PARAMETER ComputerName
Name or IP or computer to query.
.EXAMPLE
.\get-systeminfo -ComputerName WHATEVER
This will query WHATEVER for system information.
.EXAMPLE
.\get-systeminfo -ComputerName WHATEVER | Format-Table *
This will query WHATEVER and put the information in a table.

#>
param(
    [string]$ComputerName = 'localhost'
)
$os = Get-WmiObject -Class win32_operatingsystem -ComputerName $ComputerName
$cs = Get-WmiObject -Class win32_computersystem -ComputerName $ComputerName
$props  = @{'ComputerName'=$ComputerName;
            'OSVersion'=$os.version;
            'OSBuild'=$os.buildnumber;
            'SPVersion'=$os.servicepackmajorversion;
            'Model'=$cs.model;
            'Manufacturer'=$cs.manufacturer;
            'RAM'=$cs.totalphysicalmemory / 1GB -as [int];
            'Sockets'=$cs.numberofprocessors;
            'Cores'=$cs.numberoflogicalprocessors}
$obj = New-Object -TypeName PSObject -Property $props
Write-Output $obj