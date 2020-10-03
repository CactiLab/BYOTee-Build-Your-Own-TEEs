set -e

if ! ls /ectf/Xilinx_Vivado_SDK_2017.4_1216_1.tar.gz; then
    echo "You do not have the Xilinx download in the correct spot, or you grabbed the wrong version (should be 2017.4), or you renamed the file. The correct name should be Xilinx_Vivado_SDK_2017.4_1216_1.tar.gz" 1>&2
    exit 1
fi

cd /home/vagrant
cp /ectf/Xilinx_Vivado_SDK_2017.4_1216_1.tar.gz .
tar xvzf Xilinx_Vivado_SDK_2017.4_1216_1.tar.gz
rm -f Xilinx_Vivado_SDK_2017.4_1216_1.tar.gz
chown -R vagrant:vagrant /opt
