# This script is useful for cleaning up the 'project'
# directory of a Digilent Vivado-project git repository
###
# Run the following command to change permissions of
# this 'cleanup' file if needed:
# chmod u+x cleanup.sh
###
# Remove directories/subdirectories
find . -mindepth 1 -type d -exec rm -rf {} +
# Remove any other files than:
find . -type f ! -name 'cleanup.sh' \
               ! -name 'cleanup.cmd' \
               ! -name 'create_project.tcl' \
               ! -name 'create_bd.tcl' \
               ! -name 'release.py' \
               ! -name '.gitignore' \
               ! -name 'gen_bitstream.tcl' \
               -exec rm -rf {} +
find ../src/bd/system -type f ! -name system_wrapper.vhd -exec rm -rf {} +
