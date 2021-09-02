Write-Output "Configure Windows options..."
#--- Enable developer mode on the system ---
Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock -Name AllowDevelopmentWithoutDevLicense -Value 1
#--- Determine the appropriate registry path to use
# get the domain\username of the user currently logged in to the computer
$user = (Get-CimInstance -ClassName Win32_ComputerSystem).UserName
# get the SID for that user
$sid = Get-UserSID $user
$advancedKey = Join-Path -Path "Registry::HKEY_USERS\$sid" -ChildPath "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Write-Output "Modifying registry settings for $user ..."
#--- File Explorer Settings ---
# Enable hidden files to be shown in Windows Explorer
Set-ItemProperty $advancedKey Hidden 1
# Enable file extension in file names
Set-ItemProperty $advancedKey HideFileExt 1
# Enable hidden Operating System files to be shown in Windows Explorer
Set-ItemProperty $advancedKey ShowSuperHidden 1
# will expand explorer to the actual folder you're in
Set-ItemProperty $advancedKey NavPaneExpandToCurrentFolder 1
# adds things back in your left pane like recycle bin
Set-ItemProperty $advancedKey NavPaneShowAllFolders 1
# opens PC to This PC, not quick access
Set-ItemProperty $advancedKey LaunchTo 1
# taskbar where window is open for multi-monitor
Set-ItemProperty $advancedKey MMTaskbarMode 2
# Restart Explorter
try{
    Write-Output "Restarting the Windows Explorer process..."
    $xuser = Get-CurrentUser
    try { $explorer = Get-Process -Name explorer -ErrorAction stop -IncludeUserName }
    catch {$global:error.RemoveAt(0)}

    if($explorer -ne $null) {
        $explorer | ? { $_.UserName -eq "$($xuser.Domain)\$($xuser.Name)"} | Stop-Process -Force -ErrorAction Stop | Out-Null
    }

    Start-Sleep 1

    if(!(Get-Process -Name explorer -ErrorAction SilentlyContinue)) {
        $global:error.RemoveAt(0)
        start-Process -FilePath explorer
    }
} catch {$global:error.RemoveAt(0)}
