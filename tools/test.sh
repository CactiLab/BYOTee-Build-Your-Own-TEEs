# # copy secrets
# ./buildDevice -p ../ -n rit_pl_proj -bf cs -secrets_dir device1/
# # create project
# ./buildDevice -p ../ -n rit_pl_proj -bf cp -secrets_dir device1/
# # generate bitstream
# ./buildDevice -p ../ -n rit_pl_proj -bf gb -secrets_dir device1/

# build microblaze
# ./buildDevice -p ../ -n rit_pl_proj -bf bm -secrets_dir device1/
# combine bistream
./buildDevice -p ../ -n rit_pl_proj -bf cb -secrets_dir device1/

./packageDevice ../boot-image/template.bif device1/miPod.bin device1/download.bit
./deployDevice /dev/sda ../BOOT.BIN global_provisioning/audio/ device1/miPod ../boot-image/image.ub --mipod-bin-path device1/miPod.bin
