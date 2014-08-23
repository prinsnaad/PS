$name = Read-Host "VM Name"
$memory = Read-Host "Memory"
$disksize = Read-Host "Disksize"


New-VM -name "$name" -MemoryStartupBytes $memory -NewVHDPath '$name_C.vhdx' -NewVHDSizeBytes $disksize -SwitchName NA-Net