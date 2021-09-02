# Set cache path
$cachePath = Set-TempDirectory
# Development Tools
choco upgrade -cache $cachePath -y jdk8 maven soapui
#choco upgrade -cache $cachePath -y maven
#choco upgrade -cache $cachePath -y nodejs
#choco upgrade -cache $cachePath -y php --package-parameters='""/InstallDir:C:\Program Files\Php7""'
#choco upgrade -cache $cachePath -y soapui
