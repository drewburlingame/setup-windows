@ECHO OFF

REM #
REM # links to host
REM #
NET USE Z: "\\vmware-host\Shared Folders" /persistent:yes


REM #
REM # let powershell execute scripts
REM #
powershell -Command "Set-ExecutionPolicy Unrestricted -Force"


REM #
REM # install chocolatey
REM #
powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin


REM #
REM # install boxstarter
REM #
choco install boxstarter


REM #
REM # run vm setup and config
REM #
powershell -Command "Install-BoxstarterPackage -PackageName %USERPROFILE%\Utils\vm-setup.ps1"
