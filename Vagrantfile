Vagrant.configure(2) do |config|

  config.vm.define 'tutorial' do |machine|
    machine.vm.box = "hashicorp/precise32"
    machine.vm.hostname = "tutorial"
    machine.vm.network "private_network", ip: "192.168.122.10"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook ="provisioning/playbook.yml"
  end
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
