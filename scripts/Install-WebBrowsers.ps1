# Set cache path for Chocolatey
$cachePath = "C:\Temp\"
If(!(test-path $cachePath))
{
    New-Item -ItemType Directory -Force -Path $cachePath
}

# Install Browsers and Test Drivers
choco upgrade -cache $cachePath -y googlechrome
choco upgrade -cache $cachePath -y firefox
