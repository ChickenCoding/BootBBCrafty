#!/usr/bin/env bash

echo "\n creating ./dev ..."
echo "\n ****************************************"
mkdir ./dev
echo  "\n create ./dev done."

echo "\n making css directory"
echo "\n ****************************************"
cd ./dev
mkdir ./css


echo "\n making JS directory"
echo "\n ****************************************"
mkdir ./js
echo  "\n vendor/libraries"
mkdir ./js/vendor


echo "\n make LESS and STYLUS directories"
echo "\n ****************************************"
echo "\n making less directory along with /less/main.less"
mkdir "./less"
cd "./less"
touch main.less

cd ..

echo "\n making stylus directory along with /stylus/main.stylus"
mkdir ./stylus
cd ./stylus
touch main.styl

cd ..

echo "\n directories /dev/less and /dev/stylus created"
echo "\n files /dev/less/main.less and /dev/stylus/main.styl created"


echo "\n making fonts - images - index.html"
echo "\n ****************************************"
touch index.html
mkdir ./fonts
mkdir ./images
echo "\n index.html created"
echo "\n ./images and ./fonts created"


echo "creating backbone structure :"
echo "****************************************"
echo "directories [collection, model, view]"
mkdir ./js/collection
mkdir ./js/model
mkdir ./js/view
echo "structure created ! "

echo "now to create crafty dir"
echo "****************************************"
mkdir ./js/crafty
echo "directory ./js/crafty created"

echo "get and install the vendors"
cd ./js/vendor
echo "install backbone and requirejs"
echo "****************************************"
wget  -O backbone.min.js https://raw.github.com/documentcloud/backbone/master/backbone-min.js
echo "backbone installed"

ls

wget -O head.min.js "https://raw.github.com/headjs/headjs/master/dist/head.min.js"

echo "installing undescorejs "
echo "****************************************"
wget -O underscore.min.js "underscorejs.org/underscore-min.js"
echo "underscore installed"

echo "installing zeptojs (jquery alternative)"
echo "****************************************"
wget "http://zeptojs.com/zepto.min.js"
echo "zeptojs installed"

echo "installing craftyjs (2d canvas/dom engine)"
wget -O crafty.min.js "http://craftyjs.com/release/0.5.3/crafty-min.js"
echo "craftyjs installed"

echo "installing raphaeljs (svg drawing/animating lib)"
wget -O raphael.min.js "http://raw.github.com/DmitryBaranovskiy/raphael/master/raphael-min.js"
echo "raphaeljs installed"
cd ..
ls
cd ..
ls
touch config.js
touch main.js
touch router.js
echo "files config.js, main.js, router.js created (in .dev)"
ls




