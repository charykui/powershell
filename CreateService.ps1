try {
    $serviceName = "Vuln_service"
    $executablePath = "C:\Windows Files\MCSI files\binary files/vuln.exe"
    $displayName = "Vulnerable Service"
    $startupType = "auto"

    # Create the new service
    $createServiceCommand = sc.exe create $serviceName binPath= $executablePath
    Invoke-Expression -Command $createServiceCommand

    # Configure additional service properties
    $configurePropertiesCommand = sc.exe config $serviceName DisplayName= $displayName start= $startupType
    Invoke-Expression -Command $configurePropertiesCommand

    # Start the service
    #$startServiceCommand = sc.exe start $serviceName
    #Invoke-Expression -Command $startServiceCommand

    # Grant permission to everyone
    icals.exe $executablePath /grant everyone:F | Out-Null
}
catch {
    Write-Host "Errors"
}
