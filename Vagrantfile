Vagrant.configure("2") do |config|
  config.vm.box = "geerlingguy/centos8"

  am_vm_name = "ELK"

  config.vm.define am_vm_name do |am|
    am.vm.provider "virtualbox" do |vb|
      vb.name = am_vm_name
      vb.cpus = 3
      vb.memory = 3072
    end
    am.vm.hostname = am_vm_name
  end

  config.vm.network "private_network", ip: "172.22.222.222"
  config.vm.network "forwarded_port", guest: 9200, host: 9200
  config.vm.network "forwarded_port", guest: 5601, host: 5601

  config.vm.provision "shell", inline: "yum install -y git python3-pip yum-utils vim tree"
  config.vm.provision "shell", inline: "pip3 install ansible"

end
