# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # box type and name
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.hostname = "kubebox"
  config.vm.network "forwarded_port", guest: 6443, host: 6443
  config.vm.network "private_network", ip: "172.17.99.10"

  # folder sync for salt
  config.vm.synced_folder "./salt", "/srv/salt"

  # vm settings
  config.vm.provider "virtualbox" do |vb|
  # Customize the amount of memory on the VM:
    vb.cpus = "4"
    vb.memory = "4096"
  end

  config.vm.provision "shell", inline: "swapoff -a"
  # provision salt
  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
  end
end

