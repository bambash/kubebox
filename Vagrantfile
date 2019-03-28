# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "master" do |master|
    # box type and name
    master.vm.box = "bento/ubuntu-18.04"
    master.vm.hostname = "kubebox-master-01"
    master.vm.network "forwarded_port", guest: 6443, host: 6443
    master.vm.network "private_network", ip: "172.17.99.10"

    # folder sync for salt
    master.vm.synced_folder "./salt", "/srv/salt"
    master.vm.synced_folder "./files", "/vagrant"

    # vm settings
    master.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
      vb.cpus = "2"
      vb.memory = "2048"
    end

    master.vm.provision "shell", inline: "swapoff -a"
    # provision salt
    master.vm.provision :salt do |salt|
      salt.masterless = true
      salt.minion_config = "salt/minion"
      salt.run_highstate = true
      salt.verbose = true
    end
  end

  config.vm.define "node" do |node|
    # box type and name
    node.vm.box = "bento/ubuntu-18.04"
    node.vm.hostname = "kubebox-node-01"
    node.vm.network "private_network", ip: "172.17.99.11"

    # folder sync for salt
    node.vm.synced_folder "./salt", "/srv/salt"
    node.vm.synced_folder "./files", "/vagrant"

    # vm settings
    node.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
      vb.cpus = "2"
      vb.memory = "4096"
    end

    node.vm.provision "shell", inline: "swapoff -a"
    # provision salt
    node.vm.provision :salt do |salt|
      salt.masterless = true
      salt.minion_config = "salt/minion"
      salt.run_highstate = true
      salt.verbose = true
    end
  end
end

