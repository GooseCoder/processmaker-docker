# ProcessMaker docker development environment.

## Installation

1) Install docker, the latest versions will do, please follow the instructions bellow for install instructions:

https://docs.docker.com/engine/install/
https://docs.docker.com/engine/installation/centos/

2) Install the docker-compose tools:
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

$ chmod +x /usr/local/bin/docker-compose
```
3) Check out the processmaker codebase from the 3.x repository if you have the required access permissions:
```
git clone git@bitbucket.org:colosa/processmaker.git
```
or download it from Sourceforge (recommended)
```
https://sourceforge.net/projects/processmaker/files/ProcessMaker/
```
Uncompress the file into the root folder
4) Go to your processmaker directory and composer install
```
cd processmaker && composer install
```
if downloaded this step is not required.
5) Execute the rake ruby command
```
rake
```
if downloaded this step is not required either.
6) Build container
```
docker-compose build
```
7) Build container
```
docker-compose up
```
The machine should be available in the following address
```
http://localhost:8091

mysql-host:localhost port:3306
```
Internally the hostname for the mysql server is mapped as "mysql" externally you can access it using the localhost default with port 3306.