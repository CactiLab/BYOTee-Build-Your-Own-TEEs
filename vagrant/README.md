# 2020 eCTF Vagrant Setup

This repository contains the necessary code to create a virtual machine with all required dependencies for the 2020 MITRE eCTF.
Vagrant is a provisioning tool used to automatically build and configure consistent VM-based development environments through a set of simple configuration scripts.
The file `Vagrantfile` contained in this repository includes all necessary steps for constructing and provisioning the VM.

## Tools

To host the VM using Vagrant you must have the following tools installed on your host machine:

- [VirtualBox](https://www.virtualbox.org/)
- [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/)

Install VirtualBox and the VirtualBox Extension Pack first.
Note at the time of writing this document, the latest version of Vagrant (2.2.6) is NOT compatible with the latest version of Virtualbox (6.1.2).
Unfortunately, this means that you need to install Virtualbox 6.0.
If Linux is your host operating system, you will also need to add your user to the `vboxusers` group.
Next, install the latest version of Vagrant.

## System Requirements

- At least **50GB** of disk space once all the above tools are installed.
- At least **2 CPU** threads. You can operate with less but you will need to change the number of CPUs in `vagrant/config.rb`
- At least **4 GB** of ram. You can operate with less but you will need to modify the amount of provisioned ram in `vagrant/config.rb`. We recommend using no more than half of the total amount of RAM on your system.

## Provisioning the VM

### How it Works

Vagrant installs the system by setting up a base VM and then running scripts on the guest machine to configure it for the eCTF.
In this case, Vagrant will load a set of configuration variables form the `vagrant/config.rb` file and then install a base Ubuntu 18.10 box as the VM.
It will then run through each of the scripts in `vagrant/scripts` to customize the environment.

**ssh_agent.sh**

This script configures the ssh agent to automatically start and add the `~/.ssh/id_rsa` key.
Note that this key does not exist by default, but can be added to be the private key for your github repositories.

**system_setup.sh**

This script does all general system setup.
It installs the XFCE desktop environment, as well as minicom and the C man pages.

### Provision Instructions

Follow the below instructions to provision the development environment.

To use the VM:

0. Clone this repository onto your machine.
1. Go to the directory where the `Vagrantfile` is (the root of the repository that you cloned).
2. Modify configuration options contained in `vagrant/config.rb` as desired (see **Configuring The VM Installation** below).
3. Download the Vivado install package, `Vivado HLx 2017.4: All OS installer Single-File Download`, from [Xilinx's website](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive.html). This may require you to make an account with Xilinx. **Note that other versions of Vivado will not work as intended.** The install file is very large and will take some time to download, please be patient! Place this file into the folder containing the `Vagrantfile`.
4. Create, boot, and provision the VM via the `vagrant up` command.
Note that the GUI will appear before the vagrant provisioning process has completed.
**WAIT FOR VAGRANT PROCESS TO FINISH BEFORE INTERACTING WITH THE VM!!!**
5. Restart the VM for all changes to take place.
6. Launch a terminal and go into the `Xilinx_Vivado_SDK_2017.4_1216_1` folder and run `./xsetup`. This will install Vivado. Do **not** grab the latest version when prompted. We recommend placing the install files in the default location (`/opt`) and that you choose the `WebPack` version when asked.
7. Add the Vivado settings file to your `$PATH`. This will allow you to start Vivado using the `vivado` command, and the SDK using the `xsdk` command.
```bash
echo "source /opt/Xilinx/Vivado/2017.4/settings64.sh" >> /home/vagrant/.bashrc
echo "source /opt/Xilinx/SDK/2017.4/settings64.sh" >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc
```

### Customizing the Provisioning System

As part of the provisioning process, a script located at `vagrant/customizations.sh` will be run on the guest vm automatically at the end of the provisioning process.
If you want to install custom python packages or modify the environment in any way, add the commands to that bash script. Remember, if you install anything new in your environment that is required to build your submission, these need to be installed by that script, otherwise your submission will be rejected.

### Vagrant Commands

To shutdown the VM, execute the following command from your host machine:

~~~
vagrant halt
~~~

To boot and log back into the VM again, execute the following commands:

~~~
vagrant up
~~~

If you wish to use the virtual machine without a GUI, the following command can be used to SSH into a running machine.
The username and password are the standard Vagrant credentials

```
username: vagrant
password: vagrant
```

~~~
vagrant ssh
~~~

**Warning, doing the following will remove EVERYTHING. Only use in dire circumstances.**

To completely **destroy** the VM (i.e., erase the VM virtual hard drive and all of
its contents), execute the following command: (you may need to also open virtual box
virtual media manager and remove the vmdk downloaded for the OS)

~~~
vagrant destroy
~~~

### Configuring The VM Installation

The Vagrant configuration file has a number of user-configurable parameters.
The default values for these parameters are usually good for most users, but some may not be appropriate for all users depending on system specs.
Any changes should typically be made to `Vagrantfile` prior to executing `vagrant up` or `vagrant provision`.
Note that you can re-provision the system using the `vagrant up --provision` command.

## Working In The VM Environment

### Shared Folders from the Host

As part of the provisioning process, vagrant will share a system folder with the VM.
This is done through the virtualbox guest additions installed on the guest.
NOTE: Vagrant shares these folders when it brings up the machine. Therefore, you must start and stop the machine using the commands listed above in **Using Vagrant**

Sharing folder containing the `Vagrantfile` will be shared with the guest at `/ectf`.
**./ -> /ectf**

### Setting Up USB Passthrough

In order to program the SD card and view serial output from the Cora board, you will need to setup USB passthrough in Virtualbox.
From Windows and Mac hosts you should only need to add the device in the device filters in the USB Settings. Then, once the guest is booted, ensure the SD card reader and Cora devices are check in the `Settings -> USB` menu. If they are not, select the appropriate devices.

**For Linux hosts**, you must first add the host machine user to the group, `vboxusers`.

#### Accessing UART From Inside the VM

The VM comes preinstalled with `minicom`, a program that will allow you to access the UART for the device.
First, ensure that you've added the board to the USB devices in the virtualbox VM settings.
Next, run the following command
```
sudo minicom -D /dev/ttyUSB1
```
You will need to disable the `hardware flow control` setting to have UART work appropriately.
To do so, press `control A` and then `z` while running `minicom`, then hit `O`, go to `Serial port setup`, and then press `F`.
You may want to save this configuration so you don't need to set this up every time you run `minicom`.
Once you reset the board, you should see output on the screen indicating that the board is working properly.

## Things To Keep In Mind
eCTF rules dictate that you can only make changes to config.rb and customizations.sh. You will **only** be submitting these two files.

## Troubleshooting
1. Check you have all three items correctly installed
2. Make sure you wait for vagrant to completely finish before interacting with the VM
3. Reload your system and try again (vagrant reload)
4. Disable Hyper-V on windows by going Home -> turn windows features on and off -> uncheck Hyper-V. Restart your machine after this change.
