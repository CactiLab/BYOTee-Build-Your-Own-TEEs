# In Windows/MinGW we need to use NUL instead of /dev/null. This does not apply
# in Cygwin (where 'host_os' below would return as 'cygwin').
require 'rbconfig'
is_windows = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw/)

if is_windows
    $devnull = 'NUL'
else
 	$devnull = '/dev/null'
end


################################################################################
# Configuration Parameters
################################################################################

# Configure the VM name within the provider. VM instances are identified using
# their unique names.
$vm_name = "ectf-2020"

# Specify the number of CPU cores to allocate to the VM.
$num_cpus = 2

# Specify the amount of RAM to allocate to the VM (in MB).
$memory_size = 4096

# Set to 'true' to enable the VM's graphical interface and install the Ubuntu
# Desktop package (ubuntu-desktop). By default, the VM operates in headless
# mode.
$enable_gui_mode = true

# Specify the hostname for this machine.
$hostname = "vagrant-eCTF"

# Set to 'true' to enable bridged networking.
$network_bridged = false

# Set to the desired static IP address to be used by the bridged network
# interface. Leave empty to use DHCP. Ignored if $network_bridged == false.
$network_ip = ""

# A list of files to be copied to the VM. Each file will be placed at the same
# path as the source file.
$files = ["~/.bashrc", "~/.emacs", "~/.emacs.d", "~/.vimrc"]
