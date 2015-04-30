# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "argus" do |box|
    box.vm.box = "puppetlabs/centos-7.0-64-puppet"

    box.vm.provider :virtualbox do |vb|
      vb.memory = 512
      vb.name = "argus"
    end

    box.vm.network "forwarded_port", guest: 3000, host: 3000
    box.vm.synced_folder "../argus", "/code"

    box.vm.provision :shell, :path => "provision.sh", :args => "argus"
  end

  config.vm.define "mise-en-place" do |box|
    box.vm.box = "puppetlabs/centos-7.0-64-puppet"

    box.vm.provider :virtualbox do |vb|
      vb.memory = 512
      vb.name = "mise-en-place"
    end

    box.vm.network "forwarded_port", guest: 3000, host: 3000
    box.vm.synced_folder "../mise-en-place", "/code"

    box.vm.provision :shell, :path => "provision.sh", :args => "mise-en-place"
  end

#  In some cases, you may need to reload the vbox tools on your VM,
#  below is the provision to reset those services.

  # sudo /etc/init.d/vboxadd setup

end
