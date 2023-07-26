#!/bin/bash
pushd $(dirname $0) > /dev/null
root_dir=$(pwd)
popd > /dev/null

rm -rf speedtest.*
openssl req -new -nodes -x509 -nodes -days 365 -newkey rsa:2048 -keyout speedtest.key -out speedtest.crt  -subj "/C=CA/O=Malice/OU=Angria/CN=speedtest"


rm -f openspeed.conf
cat openspeed.tmpl | sed -e "s:__THIS_DIR__:$root_dir:g" | tee openspeed.conf

sudo ln -sf $root_dir/openspeed.conf /etc/nginx/sites-enabled/openspeed
sudo gpasswd -a www-data $USER
sudo systemctl restart nginx
