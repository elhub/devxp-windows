function Get-UserSID {
    param (
        [Parameter(ValuefromPipeline = $true, Position = 0)]
        [Alias('Account', 'User')]
        [string]$UserName = $env:USERNAME,
        [string]$Domain   = $env:USERDOMAIN
    )
    if ($UserName.Contains("\")) { $Domain, $UserName = $UserName -split '\\', 2 }   #"# split on the backslash
    try {
        $objUser = New-Object System.Security.Principal.NTAccount($Domain, $UserName)
        $strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
        $strSID.Value
    }
    catch [System.Security.Principal.IdentityNotMappedException] {
        Write-Warning "User '$UserName' does not exist in '$Domain'"
    }
    catch {
        throw
    }
}