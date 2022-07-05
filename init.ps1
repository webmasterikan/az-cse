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


$command = "https://raw.githubusercontent.com/webmasterikan/az-cse/main/NOikanalm-setup.ps1"


Enable-PSRemoting -Force
Invoke-Command -FilePath $command -Credential $credential -ComputerName $machineName
Disable-PSRemoting -Force

