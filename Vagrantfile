# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/trusty64'
  config.vm.hostname = 'lcms-wagon'

  config.vm.network :forwarded_port, guest: 3333, host: 3333

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true, privileged: false
  config.vm.provision :shell, path: 'start.sh', keep_color: true, run: "always", privileged: false

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end
end
