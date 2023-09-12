#!/bin/bash

apt-get install ant
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
apt-get install nodejs
apt-get install npm
install -g bower
ln -s /usr/bin/nodejs /usr/bin/node