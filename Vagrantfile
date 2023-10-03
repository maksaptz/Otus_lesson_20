# -*- mode: ruby -*-
# vim: set ft=ruby :
#Path to HDD on host

Vagrant.configure(2) do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 512
    v.cpus = 1
  end

  config.vm.define "inetRouter" do |host|
    host.vm.box = "debian/bullseye64"
    host.vm.box_version = "11.20230615.1"
    host.vm.hostname = "inetRouter"
    host.vm.network "private_network",
                     ip: "192.168.255.1",
		     netmask: "255.255.255.248",
                     adapter: 2,
                     virtualbox__intnet: "router-net"
    host.vm.network "private_network",
                     ip: "192.168.50.10",
                     adapter: 3
  end

  config.vm.define "inetRouter2" do |host|
    host.vm.box = "debian/bullseye64"
    host.vm.box_version = "11.20230615.1"
    host.vm.hostname = "inetRouter2"
    host.vm.network "private_network",
                     ip: "192.168.255.3",
                     netmask: "255.255.255.248",
                     adapter: 2,
                     virtualbox__intnet: "router-net"
    host.vm.network "private_network",
                     ip: "192.168.50.13",
                     adapter: 3
    host.vm.network "forwarded_port", guest: 8080, host: 8080
  end

  config.vm.define "centralRouter" do |host|
    host.vm.box = "debian/bullseye64"
    host.vm.box_version = "11.20230615.1"
    host.vm.hostname = "centralRouter"
    host.vm.network "private_network",
                     ip: "192.168.255.2",
                     netmask: "255.255.255.248",
                     adapter: 2,
                     virtualbox__intnet: "router-net"
    host.vm.network "private_network",
                     ip: "192.168.0.1",
                     netmask: "255.255.255.240",
                     adapter: 3,
                     virtualbox__intnet: "dir-net"
    host.vm.network "private_network",
                     ip: "192.168.0.33",
                     netmask: "255.255.255.240",
                     adapter: 4,
                     virtualbox__intnet: "hw-net"
    host.vm.network "private_network",
                     ip: "192.168.0.65",
                     netmask: "255.255.255.192",
                     adapter: 5,
                     virtualbox__intnet: "mgt-net"
    host.vm.network "private_network",
                     ip: "192.168.255.9",
                     netmask: "255.255.255.252",
                     adapter: 6,
                     virtualbox__intnet: "office1-central"
    host.vm.network "private_network",
                     ip: "192.168.255.5",
                     netmask: "255.255.255.252",
                     adapter: 7,
                     virtualbox__intnet: "office2-central"
    host.vm.network "private_network",
                     ip: "192.168.50.11",
                     adapter: 8
  end

  config.vm.define "centralServer" do |host|
    host.vm.box = "debian/bullseye64"
    host.vm.box_version = "11.20230615.1"
    host.vm.hostname = "centralServer"
    host.vm.network "private_network",
                     ip: "192.168.0.2",
                     netmask: "255.255.255.240",
                     adapter: 2,
                     virtualbox__intnet: "dir-net"
    host.vm.network "private_network",
                     ip: "192.168.50.12",
                     adapter: 3
    host.vm.provision "ansible" do |ansible|    
      ansible.playbook = "ansible/play.yml"
      ansible.inventory_path = "ansible/hosts"
      ansible.host_key_checking = "false"
      ansible.limit = "all"
    end

  end

end
#  config.vm.define "office1Router" do |host|
#    host.vm.box = "ubuntu/focal64"
#    host.vm.box_version = "20230922.0.0"
#    host.vm.hostname = "office1Router"
#    host.vm.network "private_network",
#                     ip: "192.168.255.10",
#                     netmask: "255.255.255.252",
#                     adapter: 2,
#                     virtualbox__intnet: "office1-central"
#    host.vm.network "private_network",
#                     ip: "192.168.2.1",
#                     netmask: "255.255.255.192",
#                     adapter: 3,
#                     virtualbox__intnet: "dev1-net"
#    host.vm.network "private_network",
#                     ip: "192.168.2.65",
#                     netmask: "255.255.255.192",
#                     adapter: 4,
#                     virtualbox__intnet: "test1-net"
#    host.vm.network "private_network",
#                     ip: "192.168.2.129",
#                     netmask: "255.255.255.192",
#                     adapter: 5,
#                     virtualbox__intnet: "managers-net"
#    host.vm.network "private_network",
#                     ip: "192.168.2.193",
#                     netmask: "255.255.255.192",
#                     adapter: 6,
#                     virtualbox__intnet: "office1-net"
#    host.vm.network "private_network",
#                     ip: "192.168.50.20",
#                     adapter: 7
#  end
#
#  config.vm.define "office1Server" do |host|
#    host.vm.box = "ubuntu/focal64"
#    host.vm.box_version = "20230922.0.0"
#    host.vm.hostname = "office1Server"
#    host.vm.network "private_network",
#                     ip: "192.168.2.130",
#                     netmask: "255.255.255.192",
#                     adapter: 2,
#                     virtualbox__intnet: "managers-net"
#    host.vm.network "private_network",
#                     ip: "192.168.50.21",
#                     adapter: 3
#  end
#
#  config.vm.define "office2Router" do |host|
#    host.vm.box = "debian/bullseye64"
#    host.vm.box_version = "11.20230615.1"
#    host.vm.hostname = "office2Router"
#    host.vm.network "private_network",
#                     ip: "192.168.255.6",
#                     netmask: "255.255.255.252",
#                     adapter: 2,
#                     virtualbox__intnet: "office2-central"
#    host.vm.network "private_network",
#                     ip: "192.168.1.1",
#                     netmask: "255.255.255.128",
#                     adapter: 3,
#                     virtualbox__intnet: "dev2-net"
#    host.vm.network "private_network",
#                     ip: "192.168.1.129",
#                     netmask: "255.255.255.192",
#                     adapter: 4,
#                     virtualbox__intnet: "test2-net"
#    host.vm.network "private_network",
#                     ip: "192.168.1.193",
#                     netmask: "255.255.255.192",
#                     adapter: 5,
#                     virtualbox__intnet: "office2-net"
#    host.vm.network "private_network",
#                     ip: "192.168.50.30",
#                     adapter: 6
#  end
#
#  config.vm.define "office2Server" do |host|
#    host.vm.box = "debian/bullseye64"
#    host.vm.box_version = "11.20230615.1"
#    host.vm.hostname = "office2Server"
#    host.vm.network "private_network",
#                     ip: "192.168.1.2",
#                     netmask: "255.255.255.128",
#                     adapter: 2,
#                     virtualbox__intnet: "dev2-net"
#    host.vm.network "private_network",
#                     ip: "192.168.50.31",
#                     adapter: 3
#    host.vm.provision "ansible" do |ansible|    
#      ansible.playbook = "ansible/play.yml"
#      ansible.inventory_path = "ansible/hosts"
#      ansible.host_key_checking = "false"
#      ansible.limit = "all"
#    end
#
#  end
# 
#end
