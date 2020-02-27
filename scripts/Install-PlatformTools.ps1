# Set cache path for Chocolatey
$cachePath = "C:\Temp\"
If(!(test-path $cachePath))
{
    New-Item -ItemType Directory -Force -Path $cachePath
}

# Development Tools
choco install -cache $cachePath -y vagrant
# vagrant is not automatically upgraded because it needs to be in sync with the WSL version of vagrant - thus
# automatic upgrades would risk breaking the system. Upgrade manually as required.
choco upgrade -cache $cachePath -y virtualbox
