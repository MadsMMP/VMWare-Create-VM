Import-Module vmxtoolkit

#KLIENT 1
    new-vmx -VMXName DBI_CL01TEST  -Type Hyper-V -Firmware BIOS |  #Laver VM med Hyper-V Modul og starter med BIOS
    New-VMXScsiDisk -NewDiskSize 25GB -NewDiskname SCSI0_0 | #Laver en disk til maskinen
    Add-VMXScsiDisk -LUN 0 -Controller 0 | #Adder DISK til maskinen sådan vi kan bruge den
    Connect-VMXcdromImage -ISOfile "C:\Users\$($env:UserName)\Desktop\VMWareScript\KlientISO.iso" | #Vælger ISO Fil at boot med
    Set-VMXNetworkAdapter -Adapter 0 -ConnectionType nat -Adaptertype e1000e | #Adder Network adapter og connectiontype som nat
    Set-VMXmemory -MemoryMB 2048 #Giver 2GB Ram
#    Set-VMXprocessor -Processorcount 1 |

#KLIENT 2
    new-vmx -VMXName DBI_CL02TEST  -Type Hyper-V -Firmware BIOS | #Laver VM med Hyper-V Modul og starter med BIOS
    New-VMXScsiDisk -NewDiskSize 25GB -NewDiskname SCSI0_0 | #Laver en disk til maskinen
    Add-VMXScsiDisk -LUN 0 -Controller 0 | #Adder DISK til maskinen sådan vi kan bruge den
    Connect-VMXcdromImage -ISOfile "C:\Users\$($env:UserName)\Desktop\VMWareScript\KlientISO.iso" | #Vælger ISO Fil at boot med
    Set-VMXNetworkAdapter -Adapter 0 -ConnectionType nat -Adaptertype e1000e | #Adder Network adapter og connectiontype som nat
    Set-VMXmemory -MemoryMB 2048 #Giver 2GB Ram
#    Set-VMXprocessor -Processorcount 1 |

#WINDOWS SERVER
    new-vmx -VMXName DBI_WindowsServer_DCTEST  -Type Hyper-V -Firmware BIOS | #Laver VM med Hyper-V Modul og starter med BIOS
    New-VMXScsiDisk -NewDiskSize 60GB -NewDiskname SCSI0_0 | #Laver en disk til maskinen
    Add-VMXScsiDisk -LUN 0 -Controller 0 | #Adder DISK til maskinen sådan vi kan bruge den
    Connect-VMXcdromImage -ISOfile "C:\Users\$($env:UserName)\Desktop\VMWareScript\ServerISO.iso" | #Vælger ISO Fil at boot med
    Set-VMXNetworkAdapter -Adapter 0 -ConnectionType nat -Adaptertype e1000e | #Adder Network adapter og connectiontype som nat
    Set-VMXmemory -MemoryMB 2048 #Giver 2GB Ram
#    Set-VMXprocessor -Processorcount 1 |

#LINUX SERVER
    new-vmx -VMXName DBI_LinuxTEST  -Type Hyper-V -Firmware BIOS | #Laver VM med Hyper-V Modul og starter med BIOS
    New-VMXScsiDisk -NewDiskSize 20GB -NewDiskname SCSI0_0 | #Laver en disk til maskinen
    Add-VMXScsiDisk -LUN 0 -Controller 0 | #Adder DISK til maskinen sådan vi kan bruge den
    Connect-VMXcdromImage -ISOfile "C:\Users\$($env:UserName)\Desktop\VMWareScript\LinuxISO.iso" | #Vælger ISO Fil at boot med
    Set-VMXNetworkAdapter -Adapter 0 -ConnectionType nat -Adaptertype e1000e | #Adder Network adapter og connectiontype som nat
    Set-VMXmemory -MemoryMB 2048 #Giver 2GB Ram
#    Set-VMXprocessor -Processorcount 1 |


Start-Sleep -Seconds 5 #FOR AT SIKRE OPRETTELSE SÅ VI KAN SKIFTE NAVN ELLERS KAN DEN IKKE FINDE DE FORSKELLIGE PATHS
    
#NAVN PÅ MASKINER
Set-VMXDisplayName -DisplayName DBI_CL01TEST -config "C:\Users\$($env:UserName)\Documents\Virtual Machines\DBI_CL01TEST\DBI_CL01TEST.vmx" #SKIFTER NAVN PÅ MASKINEN
Set-VMXDisplayName -DisplayName DBI_CL02TEST -config "C:\Users\$($env:UserName)\Documents\Virtual Machines\DBI_CL02TEST\DBI_CL02TEST.vmx" #SKIFTER NAVN PÅ MASKINEN
Set-VMXDisplayName -DisplayName DBI_WindowsServer_DCTEST -config "C:\Users\$($env:UserName)\Documents\Virtual Machines\DBI_WindowsServer_DCTEST\DBI_WindowsServer_DCTEST.vmx" #SKIFTER NAVN PÅ MASKINEN
Set-VMXDisplayName -DisplayName DBI_LinuxTEST -config "C:\Users\$($env:UserName)\Documents\Virtual Machines\DBI_LinuxTEST\DBI_LinuxTEST.vmx" #SKIFTER NAVN PÅ MASKINEN

Start-Sleep -Seconds 5 #STOPPER DET I LIDT TID FOR AT KUNNE NAVNGIVE DEM FORDI DE IKKE MÅ VÆRE TÆNDT MENS DET SKER

#START AF MASKINER
Start-VMX DBI_CL01TEST
Start-VMX DBI_CL02TEST
Start-VMX DBI_WindowsServer_DCTEST
Start-VMX DBI_LinuxTEST