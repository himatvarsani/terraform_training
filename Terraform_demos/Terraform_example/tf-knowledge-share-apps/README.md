# Terraform Hands on Training

Ideally this hands on training must be supervisioned by an engineer that has a good understading of terraform, however, you can try completing the Objectives by yourself. 

| **Pre-Requisites:** 
- An AWS lab setup and an account with admin access. Initial Infra TF Code - [Setup Infrastructure ](https://github.com/deensantos/tf-knowledge-share-infra)
- Backend configuration must be updated
------------


### Session 1

**Objective**
Understand Terraform by writing the code for the various components of a real world application.

**Task**
Write the Terraform code and deploy the requested application infrastructure: [Application Infrastructure](https://docs.google.com/spreadsheets/d/1O0_jQfhlU4Ks4g2BzlTGUVUbD1a-67N4sqPr39nnt-Y/edit?usp=sharing "Application") 

**Steps:**

1. Clone this Repository to your local machine. 
    a. git clone git@github.com:deensantos/tf-knowledge-share-apps.git
2. Create the directory structure for the new application. Determine the number of folders to create. Ex: Prod, Dev, Test, App, DB and etc.
3. Determine the number of terraform files that this application will be broken into. Ex: App.Tf Ebs.Tf Alb.Tf.
4. Write And Deploy The Application.

------------


### Session 2

**Objective**
Understand and correct drifts.

**Task**
Add 10GB to the DB ebs volume via Terraform - Correct all drifts before completing your change.

**Steps:**

1. Clone this repo to your local machine
2. Navigate to APP000/Prod and deploy the application
3. Copy the deployment outputs to the top of the drifts.zsh file
4. run the script drifts.zsh
5. Try increasing the non root volume of the database instance by 10GB by modyfing the terraform code
6. Review the terraform plan and fix all drifts, before applying your volume change.

------------


### Session 3

**Objective**
Understand and create Modules.

**Task**
The customer has informed you that he will be deploying several apps with the same architecture from Session 1, and also requested a few conditions.
Build a module for the app(session 1) with the following conditions:

**IF** environment is **Dev**
App instance types must be t2.micro
DB instance type must be t2.medium
EBS root size must be 15GB
EBS root type must be gp2
EBS vol_1 size must be 10GB
EBS vol_1 size must be gp2

**Steps:**

1. Clone this Repository to your local machine. 
    a. git clone git@github.com:deensantos/tf-knowledge-share-apps.git
2. Create the directory structure for the new module. 
3. Determine the number of terraform files that this module will be broken into. Ex: App.Tf Ebs.Tf Alb.Tf.
4. Deploy an application for Prod and another one for Dev using your module.




