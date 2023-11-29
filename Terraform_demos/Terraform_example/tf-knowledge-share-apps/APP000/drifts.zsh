#!/bin/bash

#COPY VARIABLES FROM TERRAFORM OUTPUT AND PASTE IT HERE
alb_arn="arn:aws:elasticloadbalancing:us-east-1:922126556992:loadbalancer/app/app000-alb-prod/a1c8eb78b20cdc3f"
app_instance_id="i-0eb1bd033b909c6b0"
app_sg_id="sg-0e69f1564d265fb81"
app_vol_id="vol-0ef6deea53f577143"
db_instance_id="i-0e7127ebd350b06da"
db_sg_id="sg-0d0d63156899b34f7"
db_vol_id="vol-08271906d7985e9c1"

echo "Causing Drifts!"

# ---------------------------- DRIFTS ---------------------------- #

# ------- SECURITY GROUP DRIFTS ------------ #

# Update APP Security Group
aws ec2 authorize-security-group-ingress --group-id $app_sg_id --protocol tcp --port 3389 --cidr 0.0.0.0/0  
# Update APP Security Group
aws ec2 authorize-security-group-ingress --group-id $app_sg_id --protocol tcp --port 22 --cidr 10.200.10.1/32
# Update DB Security Group
aws ec2 authorize-security-group-ingress --group-id $db_sg_id --protocol tcp --port 1433 --cidr 10.200.30.1/32

# ------- EBS DRIFTS ------------ #

#Increase Vol size 
aws ec2 modify-volume --size 40 --volume-id $app_vol_id
# Modify Volume type
aws ec2 modify-volume --volume-type gp2 --volume-id $db_vol_id

# ------- ALB DRIFTS ------------ #

#Add tags to ALB
aws resourcegroupstaggingapi tag-resources --resource-arn-list $alb_arn --tags APPSupport=Yes,CostCenter=1234

# ------- EC2 DRIFTS ------------ #

# Remove SG from APP instance 01
aws ec2 modify-instance-attribute --instance-id $app_instance_id --groups $app_sg_id
# Remove tag from DB Instance
aws ec2 delete-tags --resources $db_instance_id --tags Key=Department
# Resize instance
aws ec2 stop-instances --instance-ids $db_instance_id
sleep 30
aws ec2 modify-instance-attribute --instance-id $db_instance_id --instance-type "{\"Value\": \"t2.micro\"}"
aws ec2 start-instances --instance-ids $db_instance_id

echo "Drifts have been generated - Fix them all"