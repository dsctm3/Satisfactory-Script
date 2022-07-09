#Dual-Core CPU
#6GB Ram
#10GB Hard Disk Space (For the game)

#I chose 8GB, 25GB Disk Space

#Wiki:
#https://satisfactory.fandom.com/wiki/Dedicated_servers
#Firewall Rules:
#https://tice.tips/gaming/satisfactory-server/
#Linux Walkthrough:
#https://0x2142.com/how-to-set-up-a-satisfactory-dedicated-game-server/



## Get needed packages
sudo -i -u root apt-get update
sudo -i -u root apt-get install -y \
  curl \
  lib32gcc1 \
  tmux  \
  screen  \
  wget \
  unzip \
  jq


# Setup Satisfactory Directory

sudo -i -u root mkdir -p /opt/steam/logs
sudo -i -u root mkdir -p /opt/steam/satisfactory
## Add steam user

sudo -i -u root useradd -d /opt/steam -s /bin/bash steam

##
sudo -i -u root chown -R steam:steam /opt/steam/


## Download/Install Steam
sudo -i -u steam curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" -o /opt/steam/steamcmd_linux.tar.gz 
sudo -i -u steam tar -zxvf /opt/steam/steamcmd_linux.tar.gz --directory=/opt/steam/

sudo -i -u steam /opt/steam/steamcmd.sh +force_install_dir /opt/steam/satisfactory/ +login anonymous +app_update 1690800 -beta public validate +quit
sudo -i -u root ./satisfactory.service /etc/systemd/system/
sudo -i -u root systemctl enable satisfactory.service
