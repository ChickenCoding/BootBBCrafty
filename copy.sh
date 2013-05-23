#!/usr/bin/env bash

 cp -r /var/www/gameDevGrunt/*  $1
 echo $1
cd $1

 npm install -g grunt-cli grunt
 npm init

 touch Gruntfile.js

cd $1

 bash makeDevDir.sh
bash installGruntModules.sh

cd $1
 bash bbtemplate.sh "game"

cd $1
 perl createTpl.pl "game"

for param in $@
do
    if [ ${param} != $1 ]
    then
         bash bbtemplate.sh "${param}"
         perl createTpl.pl "${param}"
    fi
done


 echo "\n****************************************"
 echo "\nINSTALLED"
 echo "\n****************************************"

