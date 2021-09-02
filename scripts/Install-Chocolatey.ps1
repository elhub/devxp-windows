# Script for Installing Chocolatey
$cachePath = Set-TempDirectory
$checkChoco = powershell choco -v
if (-not($checkChoco)) {
    Write-Output "Chocolatey is not found. Installing it now..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
} else {
    Write-Output "Chocolatey detected. Checking for upgrade..."
    choco upgrade -cache $cachePath -y chocolatey
}