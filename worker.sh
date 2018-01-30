#!/usr/bin/env bash

swapoff -a

dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
dnf install -y docker-ce-17.03.0.ce-1.fc25
sed -i "s|ExecStart=/usr/bin/dockerd|ExecStart=/usr/bin/dockerd --exec-opt native.cgroupdriver=cgroupfs|" /lib/systemd/system/docker.service
systemctl daemon-reload
systemctl enable docker.service
systemctl start docker

cat /vagrant/hosts | tee -a /etc/hosts
setenforce 0
cp /vagrant/kubernetes.repo /etc/yum.repos.d/
yum install -y kubelet kubeadm kubectl
sed -i 's/driver=systemd/driver=cgroupfs/g' /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
systemctl daemon-reload
systemctl enable kubelet
systemctl start kubelet
