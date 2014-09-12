#-- win config
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar
Disable-InternetExplorerESC
Enable-RemoteDesktop
Disable-UAC
Set-TaskbarOptions -Size Small

#-- utilities
#7zip is installed on the base image
#cinst 7zip.install
#cinst 7zip.commandline
cinst ccleaner
cinst conemu
cinst curl
#cinst gow
cinst notepadplusplus.install
cinst sysinternals
cinst sumatrapdf
cinst windirstat

#-- dev tools
cinst gitextensions
cinst git-credential-winstore
cinst p4merge
cinst dotpeek
cinst fiddler4
cinst linqpad4
cinst nuget.commandline
cinst nugetpackageexplorer
cinst windbg
cinst ilmerge

Install-ChocolateyPinnedTaskBarItem "$env:programfiles\ConEmu\ConEmu64.exe"
Install-ChocolateyPinnedTaskBarItem "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe"

#mklink /D %USERPROFILE%\.bash_profile c:\hosthome\src\dotfiles\win-vm\.bash_profile
#mklink /D %USERPROFILE%\.gitconfig c:\hosthome\src\dotfiles\win-vm\.gitconfig
#mklink /D %USERPROFILE%\aliases.bat c:\hosthome\src\dotfiles\win-vm\aliases.bat

#npp - install plugins
#log2console - add udp receiver
#gitex - configure commit window
#conemu - configure
#vpn - install/configure cisco vpn
