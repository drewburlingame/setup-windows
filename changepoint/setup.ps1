Import-Module $env:AppData\Boxstarter\Boxstarter.Chocolatey -DisableNameChecking

$repoRoot = split-path -parent $PSScriptRoot

& $repoRoot\bspkg-win-base.ps1
& $repoRoot\bspkg-win-dev.ps1

cmd /c rm %USERPROFILE%\.bash_profile
cmd /c mklink %USERPROFILE%\.bash_profile c:\hosthome\src\dotfiles\win-vm\.bash_profile

cmd /c rm %USERPROFILE%\.gitconfig
cmd /c mklink %USERPROFILE%\.gitconfig c:\hosthome\src\dotfiles\win-vm\.gitconfig

cmd /c rm %USERPROFILE%\aliases.bat
cmd /c mklink %USERPROFILE%\aliases.bat c:\hosthome\src\dotfiles\win-vm\aliases.bat

#cmd /c npm install -g pullquester

#TODO: requires manual intervention to approve machine on github and enter rsa pwd
# pushd c:\src\ppm
# git pull
# popd

#TODOS
#vpn - install/configure cisco vpn
