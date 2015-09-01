#!/bin/bash

curl -sL https://deb.nodesource.com/setup | sudo bash -
apt-get install nodejs zip

npm install npm@2.5.0 -g

mkdir -p /var/www/
cd /var/www/
wget https://ghost.org/zip/ghost-latest.zip

unzip -d ghost ghost-latest.zip
cd ghost/

sudo npm install --production

PUBLIC_IP=`ifconfig eth0 | grep 'inet addr' | cut -d ':' -f 2 | cut -d ' ' -f 1`
cp config.example.js config.js
sed -i -e "s|http://my-ghost-blog.com|http://${PUBLIC_IP}|" config.js
sed -i -e "s|127.0.0.1|0.0.0.0|" config.js

npm start --production
