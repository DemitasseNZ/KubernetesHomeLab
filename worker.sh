#!/usr/bin/env bash

swapoff -a

dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
dnf install -y docker-ce-17.03.0.ce-1.fc25
systemctl enable docker.service
systemctl start docker

echo /vagrant/hsost >> /etc/hosts
setenforce 0
cp /vagrant/kubernetes.repo /etc/yum.repos.d/
yum install -y kubelet kubeadm kubectl
systemctl enable kubelet
systemctl start kubelet
