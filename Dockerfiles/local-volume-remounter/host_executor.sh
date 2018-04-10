cd /home/docker-user/
mkdir mounts
cd mounts/
mkdir disk1
mount -o bind /mnt/ /home/docker-user/mounts/disk1
