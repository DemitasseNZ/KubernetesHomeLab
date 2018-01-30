# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.define "master", primary: true do |master|
    master.vm.hostname = 'master'
    master.vm.box = "bento/fedora-25"
    master.vm.network "private_network", ip: "172.16.33.10"
    master.vm.provision :shell, path: "master.sh"
    master.vm.provider "virtualbox" do |v|
  		v.memory = 2048
	  end
  end
  config.vm.define "node1" do |node1|
    node1.vm.box = "bento/fedora-25"
    node1.vm.hostname = 'node1'
    node1.vm.network "private_network", ip: "172.16.33.11"
    node1.vm.provision :shell, path: "worker.sh"
    node1.vm.provider "virtualbox" do |v|
  		v.memory = 1024
  		v.cpus = 1
	  end
  end
  config.vm.define "node2" do |node2|
    node2.vm.box = "bento/fedora-25"
    node2.vm.hostname = 'node2'
    node2.vm.network "private_network", ip: "172.16.33.12"
    node2.vm.provision :shell, path: "worker.sh"
    node2.vm.provider "virtualbox" do |v|
  		v.memory = 1024
  		v.cpus = 1
	  end
  end
end
