Set-ExecutionPolicy Unrestricted


<#
--- Run ikanalm setup script as user not system account
#>
$myUsername = $Args[0]
$Mypassword = $Args[1]
$machineName = $env:COMPUTERNAME

$username = $env:COMPUTERNAME+'\'+$myUsername

Set-Content -Path 'C:\temp\testfile.txt' -Value 'CSE test1'
Set-Content -Path 'C:\temp\testuser.txt' -Value $username
Set-Content -Path 'C:\temp\testpass.txt' -Value $Mypassword

$password =  ConvertTo-SecureString $Mypassword -AsPlainText -Force

$credential = New-Object System.Management.Automation.PSCredential($username, $password)


#$command = "https://raw.githubusercontent.com/webmasterikan/az-cse/main/ikanalm-setup.ps1"
$command = "C:\temp\run-ikanalm-init.ps1"


Enable-PSRemoting -Force
Invoke-Command -FilePath $command -Credential $credential -ComputerName $machineName
Disable-PSRemoting -Force

stop-process -Id $PID
