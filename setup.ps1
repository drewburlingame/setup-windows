#http://bit.ly/1064hUe

set-executionpolicy unrestricted

iex ((new-object net.webclient).DownloadString('http://bit.ly/psChocInstall'))

$env:Path = $env:Path + ";c:\chocolatey\bin"

cinst ruby
cinst python
cinst git-credential-winstore
cinst gitextensions
cinst curl
cinst cmdaliases
cinst 7zip.install
cinst notepadplusplus.install
cinst virtualclonedrive
cinst webpicommandline
cinst nuget.commandline

#The OS gem allows for some easy telling if you’re on windows or not.
cinst os -source ruby