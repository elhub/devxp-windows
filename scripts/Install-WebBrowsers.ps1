# Set cache path
$cachePath = Set-TempDirectory
# Install Browsers and Test Drivers
choco upgrade -cache $cachePath -y googlechrome firefox
