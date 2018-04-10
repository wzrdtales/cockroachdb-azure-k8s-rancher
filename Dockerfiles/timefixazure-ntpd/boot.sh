curl -O https://raw.githubusercontent.com/torvalds/linux/master/tools/hv/lsvmbus
python lsvmbus -vv | grep -w "Time Synchronization" -A 3
rm lsvmbus

ntpd -b -n 
