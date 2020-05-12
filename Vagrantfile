# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "centos-five"
  config.vm.box = "bento/centos-5.11"
  config.vm.box_check_update = true

  config.vm.synced_folder ".", "/vagrant", disabled: false

  config.vm.provider "virtualbox" do |vb|
    vb.name = "centos-five"
    vb.gui = false
    vb.cpus = 2
    vb.memory = "512"
    vb.linked_clone = Gem::Version.new(Vagrant::VERSION) >= Gem::Version.new('1.8.0')
    vb.customize ["modifyvm", :id,
                  "--cpuexecutioncap", "50",
                  "--audio", "none"]
  end

  config.vm.provision "shell", inline: "yum install -y python-simplejson"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
  end
end
