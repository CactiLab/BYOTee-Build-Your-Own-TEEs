# -*- mode: ruby -*-
# vi: set ft=ruby :

required_plugins = %w( vagrant-disksize vagrant-vbguest)
$new_plugin = false
required_plugins.each do |plugin|
  # if not installed, attempt to install
  unless Vagrant.has_plugin? plugin
      system "vagrant plugin install #{plugin}"
      $new_plugin = true
    end
end

# restart vagrant if new plugin
if $new_plugin
  exec "vagrant #{ARGV.join''}"
end

# load provision config
require './vagrant/config.rb'

################################################################################
# VM Configuration
################################################################################

def provisionFile(path, config)
  if File.exist?(path)
    if File.directory?(path)
      config.vm.provision "shell", privileged: false, inline: "mkdir #{path}"
      for file in Dir[File.expand_path(path) + "/*"]
        privisionFile(file, config)
      end
    else
      config.vm.provision "file", source: path, destination: path
    end
  end
end

Vagrant.configure(2) do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "bento/ubuntu-18.10"

  config.vm.hostname = $hostname
  config.vm.box_download_insecure = true
  config.ssh.shell = "bash"

  # Enable X11 forwarding.
  config.ssh.forward_x11 = true
  config.ssh.forward_agent = true

  # Configure the VM network settings.
  if $network_bridged
    if $network_ip == ""
      config.vm.network "public_network"
    else
      config.vm.network "public_network", ip: "#{$network_ip}"
    end
  else
    # Configure port forwarding.
    config.vm.network "forwarded_port", guest: 9999, host: 9999, protocol: 'tcp'
    config.vm.network "forwarded_port", guest: 8080, host: 8080, protocol: 'udp'
    config.vm.network "forwarded_port", guest: 8080, host: 8080, protocol: 'tcp'
  end

  # VirtualBox-specific configuration.
  config.vm.provider "virtualbox" do |v|
    v.name = $vm_name
    v.gui = $enable_gui_mode
    v.cpus = $num_cpus
    v.memory = $memory_size
    config.disksize.size = '50GB'

    # set video ram to something useful
    v.customize ["modifyvm", :id, "--vram", "64"]

    # enable usb
    v.customize ["modifyvm", :id, "--usbxhci", "on"]
  end

  # sync folder
  config.vm.synced_folder "./", "/ectf"

  # configure setup ssh agent
  config.vm.provision "shell", privileged: false, path: "./vagrant/ssh_agent.sh"

  # provision scripts
  config.vm.provision "shell", privileged: false, path: "./vagrant/system_setup.sh"
  config.vm.provision "shell", path: "./vagrant/customizations.sh"

  # Store the version of the Vagrant configuration used to provision the VM.
  config.vm.provision "shell",
                      inline: "echo -n \"#{$vm_version}\" > /home/vagrant/.vm_version"
  config.vm.provision "shell", path: "vagrant/install_xilinx_tools.sh"

  config.vm.provision "shell", inline: "echo 'Provisioning complete, please reboot the machine now.'"
end
