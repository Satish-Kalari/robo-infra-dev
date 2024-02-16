module "roboshop" {
    #source = "../../rmodule-aws-vpc"
    #source = "git::https://github.com/daws-76s/terraform-aws-vpc.git?ref=main"
    #source = "git::https://github.com/Satish-Kalari/o-terra-aws-vpc.git?ref=master"
    source = "git::https://github.com/Satish-Kalari/rmodule-aws-vpc.git?ref=master"
    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    vpc_tags =   var.vpc_tags
    public_subnets_cidr = var.public_subnets_cidr #public subnet
    private_subnets_cidr = var.private_subnets_cidr #private subnet 
    database_subnets_cidr = var.database_subnets_cidr #database subnet
    is_peering_required = var.is_peering_required #peering    
}