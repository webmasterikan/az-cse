Set-ExecutionPolicy remotesigned
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationFramework

Write-Host "----------------------------"
Write-Host "DO NOT CLOSE THIS WINDOW !!!"
Write-Host "----------------------------"


<#
--- Show Balloon Notificatin icon
#>
$objNotifyIcon = New-Object System.Windows.Forms.NotifyIcon

$objNotifyIcon.Icon = "C:\temp\scm4all.ico"
$objNotifyIcon.BalloonTipTitle = "IKAN ALM Setup"
$objNotifyIcon.BalloonTipIcon = "Warning"
$objNotifyIcon.BalloonTipText = "Please wait while we prepare the system to run IKAN ALM, a message will display when finished."

$objNotifyIcon.Visible = $True
$objNotifyIcon.ShowBalloonTip(30000)


<#
--- Start the services
#>
Start-Service -Name "Tomcat9","almsvr59","almagent59"
#Start-Service -Name "Tomcat9"


<#
--- Show Balloon Notificatin icon
#>
$objNotifyIcon = New-Object System.Windows.Forms.NotifyIcon

$objNotifyIcon.Icon = "C:\temp\scm4all.ico"
$objNotifyIcon.BalloonTipTitle = "IKAN ALM Setup"
$objNotifyIcon.BalloonTipIcon = "Warning"
$objNotifyIcon.BalloonTipText = "Please wait while we prepare the system to run IKAN ALM, a message will display when finished."

$objNotifyIcon.Visible = $True
$objNotifyIcon.ShowBalloonTip(30000)


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


# Re-import the distro
wsl --set-default-version 1
$distro = "Ubuntu"
$location = "C:\wsl"
wsl --import $distro $location "C:\temp\Ubuntu-fs.tar"


<#
--- Finished dialog
#>
[System.Windows.Forms.MessageBox]::Show($this,'Done. You can now start IKAN ALM.','IKAN ALM setup','Ok','Information')


Write-Host "---------------------------------"
Write-Host "-> You may close this window now."
stop-process -Id $PID
