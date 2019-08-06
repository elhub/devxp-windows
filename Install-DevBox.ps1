# Description: Boxstarter Script
# Author: Elhub
# Common Setup for an Elhub DevBox.

Disable-UAC

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
    iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "Setup-SystemConfiguration.ps1";
executeScript "Set-WindowsExplorerOptions.ps1";
executeScript "Remove-DefaultApps.ps1";
executeScript "Install-CommonTools.ps1";
executeScript "Install-WebBrowsers.ps1";
executeScript "Install-WSL.ps1";
executeScript "Install-JavaDevTools.ps1";

#--- reenabling critial items ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula