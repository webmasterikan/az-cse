Set-ExecutionPolicy Unrestricted


<#
--- TEST TEST TEST
#>
Set-Content -Path 'C:\temp\file.txt' -Value 'CSE test string'

Start-Process net -arg "start Tomcat9"
Start-Process net -arg "start almsvr59"



