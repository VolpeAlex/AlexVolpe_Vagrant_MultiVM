# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  #Assegno variabili
  VMName1="web.m340"
  VMName2="db.m340"
  BASE_INT_NETWORK="10.10.20"
  BASE_HOST_ONLY_NETWORK = "192.168.56"
  BOX_IMAGE ="ubuntu/jammy64"
  #Configurazioni della vm web
  config.vm.define "web" do |subconfig|
    subconfig.vm.box = BOX_IMAGE 
    subconfig.vm.hostname = VMName1
    #Provision del file provision-web.sh
    subconfig.vm.provision "shell", path: "provision-web.sh"
    #Provision del file provision-creazione_db.sh
    subconfig.vm.provision "shell", path: "provision-creazione_db.sh"
    #Configurazione di rete per la scheda Intnet
	  subconfig.vm.network "private_network", ip:"#{BASE_INT_NETWORK}.10", virtualbox__intnet: true
	  #Configurazione di rete per la scheda HO
    subconfig.vm.network "private_network", ip:"#{BASE_HOST_ONLY_NETWORK}.10", name: "VirtualBox Host-Only Ethernet Adapter"
    #Mount della cartella website
    config.vm.synced_folder "website/", "/var/www/html"
	  #Subconig della vm web
    subconfig.vm.provider "virtualbox" do |vb|
		  vb.name = VMName1
		  vb.memory = "1024"
		  vb.cpus = 2
	  end
  end
  #Configurazioni della vm db
  config.vm.define "db" do |subconfig|
    subconfig.vm.box = BOX_IMAGE 
    subconfig.vm.hostname = VMName2
    #Provision del file provision-database.sh
    subconfig.vm.provision "shell", path: "provision-database.sh"
    #Configurazione di rete per la scheda Intnet
	subconfig.vm.network "private_network", ip:"#{BASE_INT_NETWORK}.11", virtualbox__intnet: true
    #Subconig della vm db
    subconfig.vm.provider "virtualbox" do |vb|
		  vb.name = VMName2
		  vb.memory = "1024"
		  vb.cpus = 2
	  end
   end
end