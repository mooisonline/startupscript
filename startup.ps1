# set to cyan and clear 
$host.UI.RawUI.ForegroundColor = "Cyan"
Clear-Host

# Display initial message
Write-Output "meowzers"
Write-Output "======================================================="
Write-Output "OS Info"
Write-Output "======================================================="

# Get OS information
Get-ComputerInfo | Select-Object OSName, OSArchitecture, WindowsVersion, WindowsBuildLabEx | Format-List

Write-Output "======================================================="
Write-Output "Hardware Info"
Write-Output "======================================================="

# CPU Information
Write-Output "CPU:"
Write-Output "____"
Get-CimInstance -ClassName Win32_Processor | Select-Object Name | Format-List

# RAM Information
Write-Output "Memory:"
Write-Output "_______"
Get-CimInstance -ClassName CIM_PhysicalMemory | Select-Object Capacity, Speed | Format-List

# Storage Information
Write-Output "Storage:"
Write-Output "________"
Get-CimInstance -ClassName Win32_DiskDrive | Select-Object DeviceID, Model, Size | Format-List

# Graphics Card Information
Write-Output "Graphics Card:"
Write-Output "______________"
Get-CimInstance -ClassName Win32_VideoController | Select-Object Name, CurrentHorizontalResolution, CurrentVerticalResolution | Format-List

Write-Output "======================================================="
Write-Output "Network Info"
Write-Output "======================================================="

# Network Information
Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration -Filter "IPEnabled = True" | Select-Object Description, MACAddress | Format-List

Write-Output "======================================================="

# Prompt user for input
do {
    $choice = Read-Host "Run gtop? [Y][N]"
    $choice = $choice.ToUpper()
    if ($choice -eq 'Y') {
        # Run gtop command (ensure gtop is available or replace with a valid command)
        gtop
        Pause
        Exit
    }
    elseif ($choice -eq 'N') {
        Write-Output "oki have a good day :3"
        Pause
        Exit
    }
    else {
        Write-Output "$choice is not valid"
        Write-Output ""
    }
} while ($choice -ne 'Y' -and $choice -ne 'N')
