#!/usr/bin/env bash

sudo echo 'creatind ./dev ...'
sudo echo "****************************************"
sudo mkdir ./dev


sudo echo 'making css directory'
sudo echo "****************************************"
cd ./dev
sudo mkdir ./css


sudo echo 'making JS directory'
sudo echo "****************************************"
sudo mkdir ./js
sudo echo  'vendor/libraries'
sudo mkdir ./js/vendor


sudo echo 'make LESS and STYLUS directories'
sudo echo "****************************************"
echo 'making less directory along with /less/main.less'
sudo mkdir "./less"
cd "./less"
sudo touch main.less
ls
cd ..
echo 'making stylus directory along with /stylus/main.stylus'
sudo mkdir ./stylus
cd ./stylus
sudo touch main.styl
ls
cd ..
ls
sudo echo "directories /dev/less and /dev/stylus created"
sudo echo " files /dev/less/main.less and /dev/stylus/main.styl created"


sudo echo "making fonts - images - index.html"
sudo echo "****************************************"
sudo touch index.html
sudo mkdir ./fonts
sudo mkdir ./images
sudo echo 'index.html created'
sudo echo './images and ./fonts created'


sudo echo "creating backbone structure :"
sudo echo "****************************************"
sudo echo "directories [collection, model, view]"
sudo mkdir ./js/collection
sudo mkdir ./js/model
sudo mkdir ./js/view
sudo echo "structure created ! "

sudo echo "now to create crafty dir"
sudo echo "****************************************"
sudo mkdir ./js/crafty
sudo echo "directory ./js/crafty created"

sudo echo "get and install the vendors"
cd ./js/vendor
sudo echo "install backbone and requirejs"
sudo echo "****************************************"
sudo wget  -O backbone.min.js https://raw.github.com/documentcloud/backbone/master/backbone-min.js
sudo echo "backbone installed"

ls

sudo wget -O head.min.js "https://raw.github.com/headjs/headjs/master/dist/head.min.js"

sudo echo "installing undescorejs "
sudo echo "****************************************"
sudo wget -O underscore.min.js "underscorejs.org/underscore-min.js"
sudo echo "underscore installed"

sudo echo "installing zeptojs (jquery alternative)"
sudo echo "****************************************"
sudo wget "http://zeptojs.com/zepto.min.js"
sudo echo "zeptojs installed"

sudo echo "installing craftyjs (2d canvas/dom engine)"
sudo wget -O crafty.min.js "http://craftyjs.com/release/0.5.3/crafty-min.js"
sudo echo "craftyjs installed"

sudo echo "installing raphaeljs (svg drawing/animating lib)"
sudo wget -O raphael.min.js "http://raw.github.com/DmitryBaranovskiy/raphael/master/raphael-min.js"
sudo echo "raphaeljs installed"
cd ..
ls
cd ..
ls
sudo touch config.js
sudo touch main.js
sudo touch router.js
sudo echo "files config.js, main.js, router.js created (in .dev)"
ls




