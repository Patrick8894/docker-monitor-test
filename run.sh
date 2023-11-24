./su_monitor/schedule_monitor_su.sh
sudo apt update
cd pm2-app
sudo apt install nodejs npm -y
sudo npm init -y
sudo npm install pm2 -g
sudo npm install chokidar
pm2 delete index
pm2 start index.js
pm2 list
# node index.js