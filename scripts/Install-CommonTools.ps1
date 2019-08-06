# Set cache path for Chocolatey
$cachePath = "C:\Temp\"
If(!(test-path $cachePath))
{
    New-Item -ItemType Directory -Force -Path $cachePath
}

# Install common packages that everyone should have
choco upgrade -cache $cachePath -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"
choco upgrade -cache $cachePath -y python3 --installargs='TargetDir=""C:\Program Files\Python3""'
choco upgrade -cache $cachePath -y atom
choco upgrade -cache $cachePath -y 7zip
choco upgrade -cache $cachePath -y sysinternals