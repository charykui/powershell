#Creating an insecure windows service
$filexist=Test-Path -Path c:\Windows Files\MCSI\
try {
  if(Test-Path -Path C:\Windows Files\MCSI\){
#create a service
    Write-Host "Creating a windows service"
    New-Service "Vulnerable_Service" -BinaryPathName $filexist | Out-Null
#Give access permission
    Write-Host "Changing file permissions"
    subinacl \Vulnerable_Service=filexist
  }
  else{
    Write-Host "File does not exist"
  }
}
catch {

}
