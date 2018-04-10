curl -O https://raw.githubusercontent.com/torvalds/linux/master/tools/hv/lsvmbus
python lsvmbus -vv | grep -w "Time Synchronization" -A 3 | grep "Device_ID" | awk '{print $3}' | | sed s/[{}]//g | tee /root/unbind || echo "already unbound" 
rm lsvmbus

ntpd -b -n 
