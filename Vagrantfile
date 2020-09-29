Vagrant.configure("2") do |config|
  config.vm.box = "geerlingguy/centos8"

  vm_name = "ELK"

  config.vm.define vm_name do |vm|
    vm.vm.provider "virtualbox" do |vb|
      vb.name = vm_name
      vb.cpus = 3
      vb.memory = 3072
    end
    vm.vm.hostname = vm_name
  end

  config.vm.network "private_network", ip: "172.22.222.222"

  config.vm.provision "shell", inline: "yum install -y git python3-pip yum-utils vim tree jq"
  config.vm.provision "shell", inline: "pip3 install ansible"

end
