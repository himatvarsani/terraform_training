#!/bin/bash
cat <<EOT >> /home/ec2-user/.ssh/id_rsa
${private_key}
EOT
chown ec2-user:ec2-user /home/ec2-user/.ssh/id_rsa
chmod 600 /home/ec2-user/.ssh/id_rsa