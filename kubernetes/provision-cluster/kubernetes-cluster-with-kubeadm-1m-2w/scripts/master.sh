#!/bin/bash

#### Initialize the Cluster and Install CNI
sudo kubeadm config images pull

# Initialize Kubernetes master node
sudo kubeadm init --apiserver-advertise-address=$MASTER_IP \
    --pod-network-cidr=$POD_CIDR \
    --service-cidr=$SERVICE_CIDR

# Set up kubectl for vagrant user
mkdir -p /home/vagrant/.kube
sudo cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
sudo chown -R vagrant:vagrant /home/vagrant/.kube

# Install Calico CNI
kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://raw.githubusercontent.com/projectcalico/calico/v3.29.1/manifests/calico.yaml

# Install MetalLB
kubectl --kubeconfig=/etc/kubernetes/admin.conf apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.9/config/manifests/metallb-native.yaml

# Wait for MetalLB to be ready
sleep 30

# Configure MetalLB with IP address pool
cat << EOF | kubectl --kubeconfig=/etc/kubernetes/admin.conf apply -f -
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: first-pool
  namespace: metallb-system
spec:
  addresses:
  - 192.168.56.200-192.168.56.250
---
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: l2-advert
  namespace: metallb-system
EOF

# Generate join command for worker nodes
kubeadm token create --print-join-command > /vagrant/join.sh
chmod +x /vagrant/join.sh

