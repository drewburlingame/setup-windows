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
cinst notepadplusplus.install
cinst sumatrapdf
cinst windirstat

Install-ChocolateyPinnedTaskBarItem "$env:programfiles\ConEmu\ConEmu64.exe"

#npp - install plugins
#log2console - add udp receiver
#gitex - configure commit window
#conemu - configure
