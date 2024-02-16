resource "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
  type = "String"
  # root module (in this case rmodule-aws-vpc) ahould output these values then only we get values
  value = module.roboshop.vpc_id 
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
  type = "StringList"
  value = join(",", module.roboshop.public_subnets_ids)
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/private_subnet_ids"
  type = "StringList"
  value = join(",", module.roboshop.private_subnets_ids)
}

resource "aws_ssm_parameter" "database_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/database_subnet_ids"
  type = "StringList"
  value = join(",", module.roboshop.database_subnets_ids)
}

# root module (in this case rmodule-aws-vpc) ahould output these values then only we get values

# output "public_subnet_ids" {
#   value = module.roboshop.private_subnets_ids
# }