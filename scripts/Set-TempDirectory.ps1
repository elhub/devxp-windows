function Set-TempDirectory {
    <#
    .SYNOPSIS
    Ensures that a c:\temp directory exists
    .LINK
    https://boxstarter.org
    #>
    $tempPath = "c:\temp\"
    If(!(test-path $tempPath))
    {
        New-Item -ItemType Directory -Force -Path $tempPath
    }
    return $tempPath
}
