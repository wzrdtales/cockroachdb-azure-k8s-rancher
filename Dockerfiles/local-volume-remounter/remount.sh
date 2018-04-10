cd /home/docker-user/
mkdir mounts
cd mounts/
mkdir disk1
mount -o bind /mnt/ /home/docker-user/mounts/disk1

echo "mounted, going to sleep..."

while :; do sleep 2073600; done
