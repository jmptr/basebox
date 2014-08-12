# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "scrumscope" do |box|
    box.vm.box = "puppetlabs/centos-6.5-64-puppet"

    box.vm.provider :virtualbox do |vb|
      vb.memory = 512
      vb.name = "scrumscope"
    end

    box.vm.network "forwarded_port", guest: 3000, host: 3000
    box.vm.synced_folder "../scrumscope", "/code"

    box.vm.provision :shell, :path => "provision.sh", :args => "scrumscope"
  end

  config.vm.define "devops" do |box|
    box.vm.box = "provisions/boxes/basebox.box"

    box.vm.provider :virtualbox do |vb|
      vb.memory = 512
      vb.name = "devops"
    end

    box.vm.network "forwarded_port", guest: 8080, host: 8090
    box.vm.network "forwarded_port", guest: 3000, host: 3000

    box.vm.synced_folder "../cisco/dev-ops/sites/arkade", "/code"

    box.vm.provision :shell, :path => "provision.sh", :args => "devops"


  end

  config.vm.define "wem" do |box|
    box.vm.box = "provisions/boxes/basebox.box"

    box.vm.provider :virtualbox do |vb|
      vb.memory = 1024
      vb.name = "wem"
    end

    box.vm.network "forwarded_port", guest: 8080, host: 8090
    box.vm.network "forwarded_port", guest: 4502, host: 4502
    box.vm.provision :shell, :path => "boxes/wem/shell/install-cq.sh"
    box.vm.provision :shell, :path => "boxes/wem/shell/start-cq.sh"

    box.vm.synced_folder "../cisco/wem", "/project"
  end

#  In some cases, you may need to reload the vbox tools on your VM,
#  below is the provision to reset those services.

  # sudo /etc/init.d/vboxadd setup

end
