Vagrant.require_version ">= 2.4.1"

ENV["LC_ALL"] = "en_US.UTF-8"

Vagrant.configure("2") do |config|
  config.vm.box = "almalinux/9"
  config.vm.box_check_update = false
  
  config.vm.synced_folder "cert_folder/", "/vagrant/cert",
    create: true,
    mount_options: ["--read-only"],
    disabled: false

  config.vm.define "node" do |node|
    node.vm.hostname = "node.local"
    # node.vm.disk :disk,
    #   name: "",
    #   primary: true,
    #   size: "10GB"

    node.vm.network "private_network",
      ip: "10.20.30.1",
      netmask: "24",
      hostname: true
    # node.vm.network "private_network", 
    #   type: "dhcp"
    node.vm.network "public_network",
      use_dhcp_assigned_default_route: true
      # bridge
    
    node.vm.provider "vmware_desktop" do |vmwr|
      vmwr.memory = "1024"
    end
    
    node.vm.provision "shell",
      inline: <<-SHELL
        echo "Updating ..."
    SHELL
  end
end
