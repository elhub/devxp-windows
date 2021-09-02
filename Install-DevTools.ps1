<#
.SYNOPSIS
Windows Install/Upgrade Script for Elhub Developer Boxes

.DESCRIPTION
This script installs and upgrades applications and utilities for an Elhub developer box o Windows.

.EXAMPLE
.\Install-DevTools.ps1

.INPUTS
None

.OUTPUTS
None

.LINK
https://github.com/elhub/dev-tools-windows

#>

Write-Verbose "Installing/Upgrading DevTools..."
# Define Utility functions
Set-ExecutionPolicy Bypass -Scope Process -Force
. .\scripts\Set-TempDirectory
. .\scripts\Get-UserSID
# Install Chocolatey
.\scripts\Install-Chocolatey
# Configure Windows
.\scripts\Configure-Windows
# Run Scripts
.\scripts\Install-CommonTools.ps1
.\scripts\Install-WebBrowsers.ps1
.\scripts\Install-JavaDevTools.ps1
# Supplementary Packages
if (test-path .\Install-PrivateApps.ps1) {
    .\Install-PrivateApps.ps1
}