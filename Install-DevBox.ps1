<#
.SYNOPSIS
Install/Upgrade Script for Elhub Developer Boxes

.DESCRIPTION
This script installs and upgrades a standard Elhub DevBox.

.EXAMPLE
.\Install-DevBox.ps1

.INPUTS
None

.OUTPUTS
None

.LINK
https://github.com/elhub

#>

Write-Verbose "Installing/Upgrading Elhub DevBox..."
# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString("https://chocolatey.org/install.ps1"))
# Run Scripts
.\scripts\Setup-SystemConfiguration.ps1
.\scripts\Set-WindowsExplorerOptions.ps1
.\scripts\Remove-DefaultApps.ps1
.\scripts\Install-CommonTools.ps1
.\scripts\Install-WebBrowsers.ps1
# .\scripts\Install-WSL.ps1 - Too time-consuming
.\scripts\Install-JavaDevTools.ps1
#.\scripts\Install-PlatformTools.ps1
# Supplementary Packages
if(test-path .\Install-PrivatePackages.ps1) {
    .\Install-PrivatePackages.ps1
}
