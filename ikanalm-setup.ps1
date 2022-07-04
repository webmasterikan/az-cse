Set-ExecutionPolicy Unrestricted


<#
--- Start the services
#>
Start-Service -Name "almsvr59","almagent59","Tomcat9"


<#
--- Install license
#>
Start-Process -FilePath "almlt.bat" -WorkingDirectory "C:\ikan\IKAN_ALM_5.9_console\deployment\config" -ArgumentList "install C:\temp\alm_license.lic" -WindowStyle "Hidden" -Wait


<#
--- Create shortcut
#>
$Shell = New-Object -ComObject ("WScript.Shell")

$ShortCut = $Shell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\IKAN ALM.lnk")

$ShortCut.TargetPath = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$ShortCut.Arguments = "http://localhost:8080/alm/"
$ShortCut.WorkingDirectory = "C:\Program Files (x86)\Microsoft\Edge\Application\"
$ShortCut.WindowStyle = 1
$ShortCut.IconLocation = "C:\webservers\apache-tomcat-9.0.58\webapps\alm\images\run-ikanalm.ico, 0"

$ShortCut.Save()


<#
--- Copy shortcut to desktop
#>
$command = @'
cmd.exe /C copy "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\IKAN ALM.lnk" %USERPROFILE%\Desktop
'@
Invoke-Expression -Command:$command


<#
--- Register and import the distro
#>
wsl --set-default-version 1
Add-AppxPackage "C:\ubuntu\Ubuntu_2004.2021.825.0_x64.appx"
$distro = "Ubuntu"
$location = "C:\wsl"
wsl --import $distro $location "C:\temp\Ubuntu-fs.tar"


<#
--- Disable the first run experience in Edge
#>
reg import C:\temp\edge.reg


<#
--- TEST TEST TEST
#>
Set-Content -Path 'C:\temp\file.txt' -Value 'test string'


stop-process -Id $PID
