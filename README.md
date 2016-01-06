# processmaker-docker

## Installation

1) Install docker, the latest versions will do, please follow the instructions bellow:

https://docs.docker.com/engine/installation/centos/

2) Install the docker-compose tools:

curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
$ chmod +x /usr/local/bin/docker-compose

3) Check out the processmaker codebase

git clone git@bitbucket.org:colosa/processmaker.git

4) Go to your processmaker directory and composer install

cd processmaker && composer install

5) Execute the rake ruby command

rake

6) Build container

docker-compose build

7) Build container

docker-compose up

The machine should be available in the following address

http://localhost:8091

mysql-host:localhost port:3306

Internally the hostname for the mysql server is mapped as "mysql"