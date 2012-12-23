setup-windows
=============

scripts to setup a base windows image


Steps
=============
1) open cmd as administrator

2) run the following: `@powershell -NoProfile -ExecutionPolicy unrestricted -Command "set-executionpolicy unrestricted"`

3) run the following: `@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('http://bit.ly/1064hUe'))"`