
# NGINX openspeed setup

Optional purge and reinstall nginx
```
sudo apt-get purge nginx nginx-common nginx-full
sudo apt-get install nginx
```

Build
```
git submodule update --init
./setup.sh
```

Open [Speed Test](http://localhost:3000)
