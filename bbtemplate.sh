#!/usr/bin/env bash

rep=dev/js/

model=model/
view=view/
collection=collection/
crafty=crafty/

for theFile in "$@"
do
    sudo touch ${rep}${view}${theFile}.view.js
    sudo touch ${rep}${model}${theFile}.model.js
    sudo touch ${rep}${crafty}${theFile}.crafty.js
    sudo touch ${rep}${collection}${theFile}.collection.js
done

sudo echo "****************************************"
sudo echo "files creates, writing process now"
sudo echo "       ***     ***   ***   ***   ***    "

#sudo chmod 777  ${rep}${view}${theFile}.js
