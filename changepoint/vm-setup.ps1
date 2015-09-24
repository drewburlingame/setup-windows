#Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions
Disable-InternetExplorerESC
Enable-MicrosoftUpdate
Install-WindowsUpdate -getUpdatesFromMS -acceptEula -criteria "BrowseOnly=1 and IsAssigned=1 and IsHidden=0 and IsInstalled=0 and Type='Software'"

#
# Autologon
#
$winlogonKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
Set-ItemProperty -Path $winlogonKeyPath -Name AutoAdminLogon -Value 1
Set-ItemProperty -Path $winlogonKeyPath -Name DefaultUserName -Value "vagrant"
Set-ItemProperty -Path $winlogonKeyPath -Name DefaultDomain -Value $env:COMPUTERNAME
Set-ItemProperty -Path $winlogonKeyPath -Name DefaultPassword -Value "vagrant"


#
# Notepad2 redirect
#
$notepadRedirectKeyPath = "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe"
$notepad2Path = "`"" + (JOIN-PATH -Path $env:USERPROFILE -ChildPath "Utils\Notepad2_x64.exe") + "`" /z"
New-Item -Path $notepadRedirectKeyPath -ErrorAction SilentlyContinue
Set-ItemProperty -Path $notepadRedirectKeyPath -Name "Debugger" -Value $notepad2Path


#
# Console settings
#
$consoleKeyPath = "HKCU:\Console"
Set-ItemProperty -Path $consoleKeyPath -Name QuickEdit -Value 1
Set-ItemProperty -Path $consoleKeyPath -Name ScreenBufferSize -Value 0x270F0078
Set-ItemProperty -Path $consoleKeyPath -Name WindowSize -Value 0x00280078
Set-ItemProperty -Path $consoleKeyPath -Name FaceName -Value "Consolas"
Set-ItemProperty -Path $consoleKeyPath -Name FontFamily -Value 54
Set-ItemProperty -Path $consoleKeyPath -Name FontSize -Value 1048576
Set-ItemProperty -Path $consoleKeyPath -Name FontWeight -Value 400

#
# Explorer settings
#
$explorerAdvancedKeyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $explorerAdvancedKeyPath -Name Start_NotifyNewApps -Value 0
Set-ItemProperty -Path $explorerAdvancedKeyPath -Name StartMenuAdminTools -Value 1
Set-ItemProperty -Path $explorerAdvancedKeyPath -Name Start_ShowNetPlaces -Value 0
Set-ItemProperty -Path $explorerAdvancedKeyPath -Name Start_ShowDownloads -Value 1
Set-ItemProperty -Path $explorerAdvancedKeyPath -Name Start_ShowUser -Value 1
Set-ItemProperty -Path $explorerAdvancedKeyPath -Name Start_PowerButtonAction -Value 4


#
# Switch to shared git config
#
$gitconfigPath = Join-Path $env:USERPROFILE .gitconfig
Remove-Item $gitconfigPath
New-Symlink -LiteralPath $gitconfigPath -TargetPath "\\vmware-host\Shared Folders\hosthome\Box Sync\Work\Programming\.gitconfig"


#
# Power config
#
#$powerPlanId = ([regex]"{(.*?)}$").Match((Get-WmiObject -Class win32_powerplan -Namespace root\cimv2\power -Filter "ElementName='High performance'").InstanceID.tostring()).groups[1].value
$powercfg = JOIN-PATH $env:SystemRoot system32\powercfg.exe
&$powercfg -X -monitor-timeout-ac 0
&$powercfg -X -monitor-timeout-dc 30


#
# Apps
#
cinst Devbox-Common.extension
#cinst cmder
cinst console2
#cinst devbox-rapidee
cinst fiddler4
cinst Firefox
cinst gallio
cinst ilspy
cinst linqpad4
cinst tortoisesvn
cinst treesizefree
cinst pscx


#
# PS Help
#
Update-Help
