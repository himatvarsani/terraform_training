#!/bin/bash
sudo yum -y install nmap
sudo yum -y install watch
echo "1" > /tmp/file
cat <<EOT >> /home/ec2-user/.ssh/id_rsa
${private_key}
EOT
chown ec2-user:ec2-user /home/ec2-user/.ssh/id_rsa
chmod 600 /home/ec2-user/.ssh/id_rsa