#!bin/bash
component=$1
environment=$2 #cant use env here
yum install python3.11-devel python3.11-pip -y
pip3.11 install ansible botocore boto3
ansible-pull -U https://github.com/Satish-Kalari/o-roboshop-ansible-roles-tf.git -e component=$component -e env=$environment main-tf.yaml

# ***Ansible Pull*** Node pulls configuration
# ***Ansible push*** Ansible server pushes configuration to node 

# installing python for ansible
# installing ansible for provisioning 

### Botocore ###
# A low-level interface that provides access to AWS tools. It offers low-level clients, session, and credential and configuration data. Botocore is compatible with Python version 3.8 and higher.

### Boto3 ###
# A package that implements the Python SDK. It builds on top of Botocore by providing its own session, resources, and collections. Boto3 is the official Python SDK for AWS.