#!/bin/bash
echo "-- Installing Apache2 --"
sleep 30
sudo apt update
sudo apt -y upgrade
sudo apt -y install apache2
