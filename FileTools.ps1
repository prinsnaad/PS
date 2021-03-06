function New-ProjectFolder {
[CmdletBinding()]
param(
    [Parameter(Mandatory=$True)]
    [string]$ProjectNr,
    
    [Parameter(Mandatory=$True)]
    [string]$Description
)
BEGIN{

}
PROCESS{

    Write-Verbose "Creating PSDrive PRoot"
    New-PSDrive -Name PRoot -PSProvider FileSystem -Root \\aec.local\data\Uppdrag\Uppdrag14 | Out-Null
        
    Write-Verbose "Creating Project folder $ProjectNr"
    New-Item -Path PRoot:\$ProjectNr -ItemType directory -Force | Out-Null
    
    Write-Verbose "Copy Desktop.ini to $ProjectNr"
    Copy-Item -Path .\desktop.ini -Destination PRoot:\$ProjectNr\desktop.ini

    Write-Verbose "Setting LocalizedResourceName to $Description"
    (Get-Content PRoot:\$ProjectNr\desktop.ini) | ForEach-Object {$_ -replace "LocalizedResourceName=", "LocalizedResourceName=$ProjectNr - $Description"} | Set-Content PRoot:\$ProjectNr\desktop.ini

    Write-Verbose "Setting attribute to System"
    Set-ItemProperty PRoot:\$ProjectNr -name Attributes -Value ([System.IO.FileAttributes]::System)
}
END{}
}

function New-ProjectFolderOther {
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