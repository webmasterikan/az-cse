Set-ExecutionPolicy Unrestricted

Write-Host "TESTing"

<#
--- Run ikanalm setup script as user not system account
#>

$myUsername = $Args[0]
$Mypassword = $Args[1]

$username = $env:COMPUTERNAME+'\'+$myUsername



$password =  ConvertTo-SecureString $Mypassword -AsPlainText -Force

$credential = New-Object System.Management.Automation.PSCredential($username, $password)




$command = "C:\temp\run-ikanalm-init.ps1"

Enable-PSRemoting –force
Invoke-Command -FilePath $command -Credential $credential -ComputerName $env:COMPUTERNAME
Disable-PSRemoting -Force

