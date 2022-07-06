Set-ExecutionPolicy Unrestricted


<#
--- TEST TEST TEST
#>
Set-Content -Path 'C:\temp\file.txt' -Value 'CSE test string'



Set-Content -Path 'C:\temp\Isthereanarg0.txt' -Value $Args[0]
Set-Content -Path 'C:\temp\Isthereanarg1.txt' -Value $Args[1]

Set-Content -Path 'C:\temp\Istherecredential.txt' -Value $credential

$testcred = $Args[0]

Start-Process net -arg "start Tomcat9" Credential $testcred
Start-Process net -arg "start almsvr59" Credential $testcred



