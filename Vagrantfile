# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "muppet"
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.60.10"
  config.vm.synced_folder "./moodle/", "/var/www/moodle/htdocs", create: true, owner: 'vagrant', :mount_options => ["dmode=777", "fmode=777"]

  config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--name", "muppet"]
      vb.customize ["modifyvm", :id, "--memory", "4096"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
  end

  config.vm.provision :shell, path: "bootstrap.sh"

  config.vm.provision "puppet" do |puppet|
  #  puppet.options = "--verbose --debug"
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file  = "init.pp"
  end

end
