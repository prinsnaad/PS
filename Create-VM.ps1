$Servername = Read-Host "Servername"
$VMSwitch = Read-Host "VMSwitch"
$VMLOC = "D:\Hyper-V\$Servername"
$Ram = Read-Host "RAM"
$ServerHDD = 60GB
$ISOPath = "D:\ISO\en_windows_server_2012_r2_x64_dvd_2707946.iso"

Mkdir -Path $VMLOC
New-VM -Name $Servername -Path $VMLOC -MemoryStartupBytes $Ram -NewVHDPath $VMLOC\"$Servername"_C.vhdx -NewVHDSizeBytes $ServerHDD -SwitchName $VMSwitch
Set-VMDvdDrive -VMName $Servername -Path $ISOPath