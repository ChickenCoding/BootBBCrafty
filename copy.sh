#!/usr/bin/env bash

sudo cp -r /var/www/gameDevGrunt/*  $1
sudo echo $1
cd $1

sudo npm install -g grunt-cli grunt
sudo npm init

sudo touch Gruntfile.js

cd $1
sudo bash makeDevDir.sh

cd $1
sudo bash bbtemplate.sh "game"

cd $1
sudo perl createTpl.pl "game"

for param in $@
do
    if [ ${param} != $1 ]
    then
        sudo bash bbtemplate.sh "${param}"
        sudo perl createTpl.pl "${param}"
    fi
done


sudo echo "****************************************"
sudo echo "INSTALLED"
sudo echo "****************************************"

