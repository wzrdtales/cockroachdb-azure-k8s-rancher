lip=$(ip route get 1 | awk '{print $NF;exit}')
echo "Connecting to ${lip}"
ssh-keygen -q -f /root/.ssh/id_rsa -N ""
cp /root/.ssh/id_rsa.pub /root/hkeys/authorized_keys2
ssh -o "StrictHostKeyChecking no" "${lip}" 'bash -s' < /host_executor.sh
rm -Rf /root/.ssh
rm /root/hkeys/authorized_keys2
echo "mounted, going to sleep..."

while :; do sleep 2073600; done
