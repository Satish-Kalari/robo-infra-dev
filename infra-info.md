VPC and SG infra is created using our custom modules created by us
    - rmodule-aws-vpv
    - rmodule-aws-sg

VPN, DATABASE, CATALOGUE, WEB nodes are created using AWS ec-2instance module
    - source = "terraform-aws-modules/ec2-instance/aws"

USER, CART and PAYMENT nodes are created using custom module exclusive for roboshop project only 
    - module-robo-app

***Ansible Pull*** Node goes to ansible server and pulls configuration
***Ansible push*** Ansible server pushes configuration to node 

Ansible and aws is developed on python  