cat <<EOF > /etc/systemd/system/remapper.service
[Unit]
Description=Remapper for azure
Before=docker.service

[Service]
Type=oneshot
# the default is not to use systemd for cgroups because the delegate issues still
# exists and systemd currently does not support the cgroup feature set required
# for containers run by docker
ExecStart=/host_remap.sh

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable remapper

cat <<EOF > /host_remap.sh 
cd /home/docker-user/
mkdir mounts
cd mounts/
mkdir disk1 && chmod a-rwx disk1
mount -o bind /mnt/ /home/docker-user/mounts/disk1
EOF

chmod +x /host_remap.sh
/host_remap.sh
