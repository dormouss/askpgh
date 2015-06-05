# -*- mode: ruby -*-
# vi: set ft=ruby :
require "yaml"

# read in our configuration file
CONF = YAML::load_file(File.join(__dir__, "vagrantconf.yml"))

Vagrant.configure("2") do |config|

  # use ubuntu 14.04
  config.vm.box = "ubuntu/trusty64"

  # setup a local ip/hostname for this machine
  config.vm.network :private_network, ip: CONF["vm"]["ip"]
  config.vm.hostname = CONF["vm"]["hostname"]

  # use puppet to initially provision this VM
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file  = "init.pp"
  end

  # Fix for slow external network connections
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end
end
