# Set cache path
$cachePath = Set-TempDirectory
# Install common packages that everyone should have
choco upgrade -cache $cachePath -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"
choco upgrade -cache $cachePath -y 7zip chocolateygui keepass sysinternals mobaxterm
#choco upgrade -cache $cachePath -y python3 --installargs='TargetDir=""C:\Program Files\Python3""'
#choco upgrade -cac he $cachePath -y atom
