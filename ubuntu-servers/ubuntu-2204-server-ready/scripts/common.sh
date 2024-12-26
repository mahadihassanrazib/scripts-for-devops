#!/bin/bash

# Update the system
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get upgrade -y

# Install required packages
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Disable swap
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab


# Set kernel parameters
sudo tee /etc/sysctl.d/kubernetes.conf <<EOT
net.ipv4.ip_forward = 1
EOT

sudo sysctl --system