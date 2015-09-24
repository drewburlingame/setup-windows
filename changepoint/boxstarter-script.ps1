#-- win config
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar
Disable-InternetExplorerESC
Enable-RemoteDesktop
Disable-UAC
Set-TaskbarOptions -Size Small

#-- utilities
if(!(Test-Path c:\7-zip )){
    cinst 7zip.install
    cinst 7zip.commandline
}
cinst ccleaner
cinst cmdaliases
cinst conemu
cinst curl
#cinst gow
#cinst lammercontextmenu
cinst listary
cinst notepadplusplus.install
cinst sysinternals
cinst sumatrapdf
cinst windirstat

#-- dev tools
cinst gitextensions
#cinst git-credential-winstore
cinst p4merge
cinst dotpeek
cinst fiddler4
cinst linqpad4
cinst nuget.commandline
cinst nugetpackageexplorer
cinst windbg
cinst ilmerge
cinst PowerGUI #powershell editor

Install-ChocolateyPinnedTaskBarItem "$env:programfiles\ConEmu\ConEmu64.exe"
Install-ChocolateyPinnedTaskBarItem "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe"

#http://stackoverflow.com/questions/18602424/how-to-unpin-library-folder-from-task-bar-using-powershell
#Uninstall-ChocolateyPinnedTaskBarItem "$env:SystemRoot\system32\ServerManager.msc"
#Uninstall-ChocolateyPinnedTaskBarItem "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe"
#Uninstall-ChocolateyPinnedTaskBarItem "$env:windir\explorer.exe"

cmd /c rm %USERPROFILE%\.bash_profile
cmd /c mklink %USERPROFILE%\.bash_profile c:\hosthome\src\dotfiles\win-vm\.bash_profile

cmd /c rm %USERPROFILE%\.gitconfig
cmd /c mklink %USERPROFILE%\.gitconfig c:\hosthome\src\dotfiles\win-vm\.gitconfig

cmd /c rm %USERPROFILE%\aliases.bat
cmd /c mklink %USERPROFILE%\aliases.bat c:\hosthome\src\dotfiles\win-vm\aliases.bat

cmd /c rm c:\scripts
cmd /c mklink /D c:\scripts c:\hosthome\src\scripts\win\

xcopy /S/Y C:\hosthome\src\setup-windows\changepoint\Notepad++ C:\Users\Administrator\AppData\Roaming\Notepad++

#http://www.windows-commandline.com/change-computer-name-command-line/

#cd "c:\Program Files\Membase\Server\bin"
#service_stop.bat
#service_unregister.bat
#service_register.bat ns_1@127.0.0.1
#service_start.bat

#execute the following sql to rename the sql server instance
#sp_dropserver 'WIN-2008R2SP1'
#sp_addserver 'winvm-drewburli', local;
#update [EPS].[dbo].[Enterprise] set DatabaseServer = 'winvm-drewburli' where DatabaseServer = 'WIN-2008R2SP1'
#DbDeployConsole.exe /eps /eds /els /ppmServers=winvm-drewburli /rds

#change server in ppm configs

#npp - install plugins
#log2console - add udp receiver
#gitex - configure commit window
#conemu - configure
#vpn - install/configure cisco vpn
