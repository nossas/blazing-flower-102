# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "meurio"

  config.vm.forward_port 3000, 3000

  config.vm.share_folder "v-data", "/home/vagrant/meurio", "."
end
