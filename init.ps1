Set-ExecutionPolicy Unrestricted


<#
--- Run ikanalm setup script as user not system account
#>
$myUsername = $Args[0]
$Mypassword = $Args[1]
$machineName = $env:COMPUTERNAME



$username = $env:COMPUTERNAME+'\'+$myUsername



$password =  ConvertTo-SecureString $Mypassword -AsPlainText -Force

$credential = New-Object System.Management.Automation.PSCredential($username, $password)

$command = $PSScriptRoot + "\ikanalm-setup.ps1"


Invoke-Command -FilePath $command -Credential $credential -ComputerName $machineName -ArgumentList $myUsername, $Mypassword



