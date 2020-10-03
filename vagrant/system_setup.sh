sudo apt-get update

echo "Installing XFCE Desktop Environment"
sudo apt-get install xfce4 -y

# auto start gui on boot
echo "exec startxfce4" >> $HOME/.xinitrc
echo "[[ -z \$DISPLAY && \$XDG_VTNR -eq 1 ]] && exec startx" >> $HOME/.bashrc

echo "Installing system tools..."
sudo apt-get install gnome-terminal gnome-disk-utility -y

echo "Setting default shell to bash."
sudo rm /bin/sh
sudo ln -s /bin/bash /bin/sh

# add ectf paths to environment
sudo apt-get install minicom manpages-dev manpages-posix-dev -y
sudo chown -R vagrant:vagrant /opt
# Install the 32-bit libraries required for gcc-mb
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y libc6:i386 libncurses5:i386 libstdc++6:i386
sudo apt install -y libtinfo5
