# Set cache path for Chocolatey
$cachePath = "C:\Temp\"
If(!(test-path $cachePath))
{
    New-Item -ItemType Directory -Force -Path $cachePath
}

# Development Tools
choco upgrade -cache $cachePath -y jdk8
choco upgrade -cache $cachePath -y maven
choco upgrade -cache $cachePath -y nodejs
choco upgrade -cache $cachePath -y php --package-parameters='""/InstallDir:C:\Program Files\Php7""'
choco upgrade -cache $cachePath -y intellijidea-ultimate
choco upgrade -cache $cachePath -y selenium-all-drivers
choco upgrade -cache $cachePath -y soapui
