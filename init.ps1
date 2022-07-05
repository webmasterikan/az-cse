Set-ExecutionPolicy Unrestricted


<#
--- Run ikanalm setup script as user not system account
#>

$myUsername = $Args[0]
$Mypassword = $Args[1]

$username = $env:COMPUTERNAME+'\'+$myUsername



$password =  ConvertTo-SecureString $Mypassword -AsPlainText -Force

$credential = New-Object System.Management.Automation.PSCredential($username, $password)

Write-Host "Just testing"

$command = "https://raw.githubusercontent.com/webmasterikan/az-cse/main/ikanalm-setup.ps1"

Invoke-Command -FilePath $command -Credential $credential -ComputerName $env:COMPUTERNAME

