setup-windows
=============

scripts to setup a base windows image

these scripts use 


Steps
=============
1) open cmd as administrator

2) run the following: 
> `@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('http://bit.ly/12JDVpX'))"`

3) to install extra windows utilities:
> `@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('http://bit.ly/Y55ci9'))"`

3) to install dev utilities:
> `@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('http://bit.ly/UnTyRO'))"`