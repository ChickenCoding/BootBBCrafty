#!/usr/bin/env bash

rep=dev/js/

model=model/
view=view/
collection=collection/
crafty=crafty/

for theFile in "$@"
do
     touch ${rep}${view}${theFile}.view.js
     touch ${rep}${model}${theFile}.model.js
     touch ${rep}${crafty}${theFile}.crafty.js
     touch ${rep}${collection}${theFile}.collection.js
done

 echo "****************************************"
 echo "files creates, writing process now"
 echo "       ***     ***   ***   ***   ***    "

