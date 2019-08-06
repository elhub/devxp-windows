# Set cache path for Chocolatey
$cachePath = "C:\Temp\"
If(!(test-path $cachePath))
{
    New-Item -ItemType Directory -Force -Path $cachePath
}

# Install Windows Subsystem for Linux
choco upgrade -cache $cachePath -y Microsoft-Windows-Subsystem-Linux --source="'windowsfeatures'"

#--- Ubuntu ---
# TODO: Move this to choco install once --root is included in that package
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile ~/Ubuntu.appx -UseBasicParsing
$FileVersion = (Get-ItemProperty -Path ~/Ubuntu.appx).VersionInfo.ProductVersion
$HighestInstalledVersion = Get-AppxPackage -Name Ubuntu* |
        Sort-Object -Property Version |
        Select-Object -ExpandProperty Version -Last 1
if ( $HighestInstalledVersion -lt $FileVersion ) {
    Add-AppxPackage -Path ~/Ubuntu.appx
    # run the distro once and have it install locally with root user, unset password
    RefreshEnv
    Ubuntu1804 install --root
    Ubuntu1804 run apt update
    Ubuntu1804 run apt upgrade -y
}
