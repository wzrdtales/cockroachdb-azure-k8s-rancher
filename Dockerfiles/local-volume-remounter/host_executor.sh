cat <<EOF > /etc/systemd/system/remapper.service
[Unit]
Description=Remapper for azure
After=network.target docker.socket
Requires=docker.socket
Before=docker.service

[Service]
Type=oneshot
ExecStart=/bin/bash "/host_remap.sh"
User=root
Group=root

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
