
cmd /c rm %USERPROFILE%\.bash_profile
cmd /c mklink %USERPROFILE%\.bash_profile c:\hosthome\src\dotfiles\win-vm\.bash_profile

cmd /c rm %USERPROFILE%\.gitconfig
cmd /c mklink %USERPROFILE%\.gitconfig c:\hosthome\src\dotfiles\win-vm\.gitconfig

cmd /c rm %USERPROFILE%\aliases.bat
cmd /c mklink %USERPROFILE%\aliases.bat c:\hosthome\src\dotfiles\win-vm\aliases.bat

cmd /c rm c:\scripts
cmd /c mklink /D c:\scripts c:\hosthome\src\scripts\win\