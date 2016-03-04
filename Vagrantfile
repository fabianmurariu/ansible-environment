# This guide is optimized for Vagrant 1.7 and above.
# Although versions 1.6.x should behave very similarly, it is recommended
# to upgrade instead of disabling the requirement below.
Vagrant.require_version ">= 1.7.0"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define "main"

    config.vm.box = "ubuntu/trusty64"

    config.vm.provider "virtualbox" do |v|
        v.memory = 512
        v.cpus = 2
    end

    # Disable the new default behavior introduced in Vagrant 1.7, to
    # ensure that all Vagrant machines will use the same SSH key pair.
    # See https://github.com/mitchellh/vagrant/issues/5005
    config.ssh.insert_key = false

    # Provision Ansible into the environment
    config.vm.provision "shell", inline: "export DEBIAN_FRONTEND=noninteractive"
    config.vm.provision "shell", inline: "sudo apt-get install -y -q software-properties-common"
    config.vm.provision "shell", inline: "sudo apt-add-repository -y ppa:ansible/ansible"
    config.vm.provision "shell", inline: "sudo apt-get update -q"
    config.vm.provision "shell", inline: "sudo apt-get install -y -q ansible"

    # Install Ansible's AWS dependencies
    config.vm.provision "shell", inline: "sudo apt-get install -y -q python-pip"
    config.vm.provision "shell", inline: "sudo pip install boto"

    # Configure Ansible to use a dynamic AWS inventory
    config.vm.provision "shell", inline: "wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py"
    config.vm.provision "shell", inline: "sudo mv ec2.py /etc/ansible/hosts"
    config.vm.provision "shell", inline: "sudo chmod +x /etc/ansible/hosts"
    config.vm.provision "shell", inline: "wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini"
    config.vm.provision "shell", inline: "sudo mv ec2.ini /etc/ansible/ec2.ini"

    # Configure the default user's environment to use Ansible with AWS

    # Sync the user's home folder
    config.vm.synced_folder "~/", "/home/host-machine"
end