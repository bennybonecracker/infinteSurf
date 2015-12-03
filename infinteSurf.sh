#!/bin/bash

echo "This script will change MAC address for wlan0."
echo "If error occurs, try to run the script again."
echo "To restore old MAC, enable and disable the network card."

sudo rm ~/.rnd
newMac="$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')"
echo "New MAC:" $newMac

sudo ifconfig wlan0 down
sudo ifconfig wlan0 hw ether $newMac
sudo ifconfig wlan0 up