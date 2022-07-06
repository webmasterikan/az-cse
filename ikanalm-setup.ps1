Set-ExecutionPolicy Unrestricted


<#
--- TEST TEST TEST
#>
Set-Content -Path 'C:\temp\file.txt' -Value 'CSE test string'



Set-Content -Path 'C:\temp\Isthereanarg0.txt' -Value $Args[0]
Set-Content -Path 'C:\temp\Isthereanarg1.txt' -Value $Args[1]


$myUsername = $Args[0]
$Mypassword = $Args[1]

$username = $env:COMPUTERNAME+'\'+$myUsername

Set-Content -Path 'C:\temp\newusername.txt' -Value $username

$password =  ConvertTo-SecureString $Mypassword -AsPlainText -Force

$credential = New-Object System.Management.Automation.PSCredential($username, $password)

Start-Process net -arg "start Tomcat9" -Credential $credential | Out-File 'C:\temp\tomcatlog.txt'
Start-Process net -arg "start almsvr59" -Credential $credential | Out-File 'C:\temp\almsrc95log.txt'





