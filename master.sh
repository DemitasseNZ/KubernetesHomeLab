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
sed -i 's/driver=systemd/driver=cgroupfs/g' /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
systemctl daemon-reload
systemctl enable kubelet
systemctl start kubelet


kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address 172.16.33.10 > /home/vagrant/kubeinit.log
chown vagrant:vagrant /home/vagrant/kubeinit.log
mkdir ~/.kube
cp -i /etc/kubernetes/admin.conf ~/.kube/config
export KUBECONFIG=~/.kube/config
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml >> /home/vagrant/kubeinit.log
#kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml >> /home/vagrant/kubeinit.log

mkdir -p /home/vagrant/.kube
cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown vagrant:vagrant /home/vagrant/.kube
chown vagrant:vagrant /home/vagrant/.kube/config
echo "export KUBECONFIG=/home/vagrant/.kube/config" | tee -a /home/vagrant/.bashrc
