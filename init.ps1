Set-ExecutionPolicy Unrestricted


<#
--- Run ikanalm setup script as user not system account
#>
$myUsername = $Args[0]
$Mypassword = $Args[1]
$machineName = $env:COMPUTERNAME

Set-Content -Path 'C:\temp\arg0.txt' -Value $Args[0]
Set-Content -Path 'C:\temp\arg1.txt' -Value $Args[1]
Set-Content -Path 'C:\temp\arg2.txt' -Value $Args[2]
Set-Content -Path 'C:\temp\arg3.txt' -Value $Args[3]

$username = $env:COMPUTERNAME+'\'+$myUsername

Set-Content -Path 'C:\temp\testfile.txt' -Value 'CSE test1'
Set-Content -Path 'C:\temp\testuser.txt' -Value $username
Set-Content -Path 'C:\temp\testpass.txt' -Value $Mypassword


Set-Content -Path 'C:\temp\filevar.txt' -Value $file
Set-Content -Path 'C:\temp\psscriptrootvar.txt' -Value $PSScriptRoot

$password =  ConvertTo-SecureString $Mypassword -AsPlainText -Force

$credential = New-Object System.Management.Automation.PSCredential($username, $password)

$command = $PSScriptRoot + "\ikanalm-setup.ps1"


Invoke-Command -FilePath $command -Credential $credential -ComputerName $machineName -ArgumentList $credential



