Set-ExecutionPolicy Unrestricted


<#
--- Run ikanalm setup script as user not system account
#>

$username = $Args[0]
$password = $Args[1]


#$password =  ConvertTo-SecureString "[your admin account user password]" -AsPlainText -Force
#$credential = New-Object System.Management.Automation.PSCredential("$env:COMPUTERNAME\[your admin account]", $password)
#$command = $file = $PSScriptRoot + "\CustomScriptSQLPS.ps1"

$credential = New-Object System.Management.Automation.PSCredential("$env:COMPUTERNAME\$username", $password)

$command = "https://raw.githubusercontent.com/webmasterikan/az-cse/main/ikanalm-setup.ps1"

Invoke-Command -FilePath $command -Credential $credential -ComputerName $env:COMPUTERNAME

