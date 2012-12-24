#http://bit.ly/12JDVpX

set-executionpolicy unrestricted

mkdir c:\tools
mkdir c:\tools\chocolatey

[Environment]::SetEnvironmentVariable("chocolatey_bin_root", "c:\tools", "Machine")
[Environment]::SetEnvironmentVariable("ChocolateyInstall", "c:\tools\chocolatey", "Machine")

iex ((new-object net.webclient).DownloadString('http://bit.ly/psChocInstall'))

$env:Path = $env:Path + ";c:\chocolatey\bin"

#boxstarter = 
#  install windows updates
#  disable: shutdown tracker, IE enhanced security config
#  enable: remote desktop, 
#  set explorer options, small taskbar
cinst jivkok.boxstarter1
cinst ruby
cinst python
cinst git-credential-winstore
cinst curl
cinst cmdaliases
cinst 7zip.install
cinst 7zip.commandline
cinst notepadplusplus.install
cinst virtualclonedrive
cinst webpicommandline
cinst nuget.commandline
cinst linkshellextension
cinst jing
cinst teamviewer
cinst swissfileknife
cinst filezilla

#The OS gem allows for some easy telling if you’re on windows or not.
cinst os -source ruby