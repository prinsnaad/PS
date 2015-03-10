$NAErrorLogPreference = "C:\error.txt"

function Get-NASystemInfo {
    <#
    .SYNOPSIS
    Gets computer information from local or remote machine.
    .DESCRIPTION
    Stuff n WMI ports open plx.
    .PARAMETER ComputerName
    Name of computer to query. Accepts multiple values and accepts values from pipleline.
    .PARAMETER IPAddress
    The IP address to query. Accepts multiple values but not from pipeline.
    .PARAMETER ShowProgress
    Displays a progress bar showing status and percent complete.
    .EXAMPLE
    Get-NASystemInfo -ComputerName WHATEVER
    This will query WHATEVER for system information.
    .EXAMPLE
    Get-NASystemInfo -ComputerName WHATEVER | Format-Table *
    This will query WHATEVER and put the information in a table.
    .EXAMPLE
    Get-NASystemInfo -IPAddress x.x.x.x
    Queries using IP instead of computer name.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$True,
                   ValueFromPipeline=$True,
                   ValueFromPipelineByPropertyName=$True,
                   ParameterSetName='computername',
                   HelpMessage="Computer name to query through WMI")]
        [Alias('hostname')]
        [ValidateLength(4,10)]
        [string[]]$ComputerName,
           
        [Parameter(Mandatory=$True,
                    ParameterSetName='ip',
                    HelpMessage="IP Address to query through WMI")]
        [ValidatePattern('\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}')]
        [string[]]$IPAddress,
         
        [Parameter()]
        [string]$ErrorLogFilePath = $NAErrorLogPreference,

        [switch]$ShowProgress
    )
    BEGIN {
        if ($PSBoundParameters.ContainsKey('ipaddress')) {
            Write-Verbose "Putting IP address into variable"
            $ComputerName = $IPAddress
        }
        $each_computer = (100 / ($ComputerName.count) -as [int])
        $current_complete = 0
    }
    PROCESS { 
        foreach ($computer in $ComputerName) {

            if ($computer -eq '127.0.0.1') {
                Write-Warning "Connecting to local computer loopback!"
            }

            if ($showprogress) { Write-Progress -Activity "Working on $computer" -PercentComplete $current_complete }

            Write-Verbose "Connecting via WMI to $computer"
            if ($showprogress) { Write-Progress -Activity "Working on $computer" -CurrentOperation "Operation System" -PercentComplete $current_complete }
            $os = Get-WmiObject -Class win32_operatingsystem -ComputerName $Computer

            if ($showprogress) { Write-Progress -Activity "Working on $computer" -CurrentOperation "Computer System" -PercentComplete $current_complete }
            $cs = Get-WmiObject -Class win32_computersystem -ComputerName $Computer

            Write-Verbose "Finished with WMI, building output"
            if ($showprogress) { Write-Progress -Activity "Working on $computer" -CurrentOperation "Creating output" -PercentComplete $current_complete }
            $props  = @{'ComputerName'=$Computer;
                        'OSVersion'=$os.version;
                        'OSBuild'=$os.buildnumber;
                        'SPVersion'=$os.servicepackmajorversion;
                        'Model'=$cs.model;
                        'Manufacturer'=$cs.manufacturer;
                        'RAM'=$cs.totalphysicalmemory / 1GB -as [int];
                        'Sockets'=$cs.numberofprocessors;
                        'Cores'=$cs.numberoflogicalprocessors;
                        'SystemType'=$cs.SystemType} 
            $obj = New-Object -TypeName PSObject -Property $props

            Write-Verbose "Send output to pipeline"
            Write-Output $obj

            Write-Verbose "Done with $computer"
            $current_complete += $each_computer
             if ($showprogress) { Write-Progress -Activity "Working on $computer" -PercentComplete $current_complete }
        }
    }
    END {
        if ($showprogress) { Write-Progress -Activity "Done" -Completed }
    }
}

#Get-NASystemInfo -ComputerName p1022,localhost,127.0.0.1,localhost,p1022,localhost,127.0.0.1 -ShowProgress