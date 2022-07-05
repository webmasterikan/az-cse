Set-ExecutionPolicy Unrestricted


<#
--- Run ikanalm setup script as user not system account
#>
$myUsername = ikanalmadmin
$Mypassword = trAT2IreCGpt7suqzJVZ
$machineName = $env:COMPUTERNAME

$username = $env:COMPUTERNAME+'\'+$myUsername



$password =  ConvertTo-SecureString $Mypassword -AsPlainText -Force

$credential = New-Object System.Management.Automation.PSCredential($username, $password)


$command = "https://raw.githubusercontent.com/webmasterikan/az-cse/main/ikanalm-setup.ps1"


Enable-PSRemoting -Force
Invoke-Command -FilePath $command -Credential $credential -ComputerName $machineName
Disable-PSRemoting -Force

stop-process -Id $PID
