#!/bin/bash
cat <<EOT >> /home/ec2-user/script.sh
#!/bin/bash
FILE=/tmp/file
KEY=/home/ec2-user/.ssh/id_rsa

if test -f "$$FILE"; then
   # Read file and increment the number
        num=\`cat \$$FILE\`
        num=$((num+=1)) && echo $num > $$FILE
        MYIP=``ifconfig eth0 | awk '$$1 == "inet" {print $$2}'``
    # Find the next server to send it to
                if [[ $$MYIP = "${private1_ip}" ]]; then
                        scp $$FILE ${private1_ip}:/tmp/file
                fi
                if [[ $$MYIP = "${private2_ip}" ]]; then
                        scp $$FILE ${private2_ip}:/tmp/file
                fi
                if [[ $$MYIP = "${private3_ip}" ]]; then
                        scp $$FILE ${private3_ip}:/tmp/file
                fi
                if [[ $$MYIP = "${private4_ip}" ]]; then
                        scp $$FILE ${private4_ip}:/tmp/file
                fi
                if [[ $$MYIP = "${private5_ip}" ]]; then
                        scp $$FILE ${private5_ip}:/tmp/file
                fi
        rm $$FILE
fi
EOT
chmod +x /home/script.sh
cat <<EOT >> /home/ec2-user/.ssh/id_rsa
${private_key}
EOT
chown ec2-user:ec2-user /home/ec2-user/.ssh/id_rsa
chmod 600 /home/ec2-user/.ssh/id_rsa
scp /home/ec2-user/script.sh ${private1_ip}:/home/ec2-user/script.sh 
scp /home/ec2-user/script.sh ${private2_ip}:/home/ec2-user/script.sh 
scp /home/ec2-user/script.sh ${private3_ip}:/home/ec2-user/script.sh 
scp /home/ec2-user/script.sh ${private4_ip}:/home/ec2-user/script.sh 
scp /home/ec2-user/script.sh ${private5_ip}:/home/ec2-user/script.sh 

ssh ${private1_ip} bash -c "nohup watch -n 15 --precise /home/ec2-user/script.sh >/dev/null &"
ssh ${private2_ip} bash -c "nohup watch -n 15 --precise /home/ec2-user/script.sh >/dev/null &"
ssh ${private3_ip} bash -c "nohup watch -n 15 --precise /home/ec2-user/script.sh >/dev/null &"
ssh ${private4_ip} bash -c "nohup watch -n 15 --precise /home/ec2-user/script.sh >/dev/null &"
ssh ${private5_ip} bash -c "nohup watch -n 15 --precise /home/ec2-user/script.sh >/dev/null &"