setup-windows
=============

scripts to setup a base windows image


Steps
=============
1) open powershell as administrator

2) run the following: `set-executionpolicy unrestricted` and type `Y`

3) run the following: `@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://github.com/drewburlingame/setup-windows/blob/master/setup.ps1'))"`