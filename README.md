**Compile for Windows**

To compile Lxi Tools windows exexcutabe  MSY2 build is used. In msys2_scripts folder are all scripts needed to compile and pack software correctly.

Easiest way is to use Linux/WSL2 docker to build complete image. Docker script uses official MSYS2 docker image from:

[msys2-docker](https://github.com/msys2/msys2-docker)

In your git clone simply run:

`git submodule update --init`

`sh docker/docker_command.sh`

To compile on windows using MSYS2 use version [2024-07-2](https://github.com/msys2/msys2-installer/releases/download/2024-07-27/msys2-x86_64-20240727.exe). It is good to use clean version without any package installed.

To compile in MSYS2 run following command in your git clone:

`sh msys2_scripts/msys2-lxi-tools-full.sh`


Docker or MSYS2 enviroment will generate `lxi-tools.exe` installer.


**Install mDNS Bonjour software**

Lxi Tools Windows executable supports mDNS. It has support for Apple Bonjour software.

To install Bonjour software please download [iTunes](https://www.apple.com/itunes/)

Even it is exe file simply unzip file.

`unzip iTunes64Setup.exe`

And then install Bonjour64.msi


**Run in Virtual Box(Issue)**


To run in Virtualbox you need to disable 3D acceleration
