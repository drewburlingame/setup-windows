set-executionpolicy unrestricted

iex ((new-object net.webclient).DownloadString('http://bit.ly/psChocInstall'))

$env:Path = $env:Path + ";c:\chocolatey\bin"

cinst ruby
cinst python
cinst git-credential-winstore
cinst gitextensions
cinst curl
cinst cmdaliases
cinst notepadplusplus.install
cinst virtualclonedrive
cinst 7zip.install
cinst webpicommandline
cinst nuget.commandline

chocolatey sources add -name drew-nuget -source "https://github.com/drewburlingame/setup-windows/nuget"
chocolatey sources add -name daptiv-nuget -source "https://github.com/daptiv/setup-windows"