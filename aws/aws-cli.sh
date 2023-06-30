#!/bin/sh
sudo apt-get update
sudo apt-get install -yy less
sudo apt-get install curl
sudo apt-get install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install