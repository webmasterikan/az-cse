Set-ExecutionPolicy Unrestricted


<#
--- Run ikanalm setup script as user not system account
#>

$myUsername = $Args[0]
$Mypassword = $Args[1]

$username = $env:COMPUTERNAME+'\'+$myUsername


#$password =  ConvertTo-SecureString "[your admin account user password]" -AsPlainText -Force
#$credential = New-Object System.Management.Automation.PSCredential("$env:COMPUTERNAME\[your admin account]", $password)
#$command = $file = $PSScriptRoot + "\CustomScriptSQLPS.ps1"


$password =  ConvertTo-SecureString $Mypassword -AsPlainText -Force
#$credential = New-Object System.Management.Automation.PSCredential("$env:COMPUTERNAME\$username", $password)
$credential = New-Object System.Management.Automation.PSCredential($username, $password)


$command = "https://raw.githubusercontent.com/webmasterikan/az-cse/main/ikanalm-setup.ps1"

#$command = "C:\temp\run-ikanalm-init.ps1"

Enable-PSRemoting –force
Invoke-Command -FilePath $command -Credential $credential -ComputerName $env:COMPUTERNAME
Disable-PSRemoting -Force

