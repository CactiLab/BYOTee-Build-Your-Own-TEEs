# add tools to the path
# THIS MUST BE UPDATED TO WORK WITH YOUR DESIGN SO THAT ALL TOOLS ARE ON THE PATH
export PATH="/ectf/tools:$PATH"
echo "export PATH=/ectf/tools:$PATH" >> ~/.bashrc
sudo apt install -y python3-pip
sudo pip3 install numpy
