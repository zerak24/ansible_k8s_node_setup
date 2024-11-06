packer {
  required_plugins {
    vagrant = {
      version = ">= 1.1.5"
      source = "github.com/hashicorp/vagrant"
    }
    vmware = {
      version = ">= 1.1.0"
      source = "github.com/hashicorp/vmware"
    }
  }
}

source "vmware-iso" "base" {
  # general
  vm_name = "base"
  guest_os_type = "Ubuntu_64"
  # images
  iso_url = "ubuntu-24.04.1-live-server-amd64.iso"
  iso_checksum = "sha256:e240e4b801f7bb68c20d1356b60968ad0c33a41d00d828e74ceb3364a0317be9"
  # communication
  ssh_username = "ubuntu"
  ssh_password = "ubuntu@base"
  ssh_timeout = "10m"
  # hardware
  cpus = 2
  cores = 2
  memory = 2048
  network = "nat"
  # shutdown
  shutdown_command = "shutdown -P now"
  shutdown_timeout = "1h"
}

build {
  sources = [
    "source.vmware-iso.base"
  ]
  post-processor "vagrant" {
    output = "base.box"
  }
}
