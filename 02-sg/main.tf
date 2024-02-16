module "mongodb" {
    # source = "../../o-terra-aws-sg"
    source = "git::https://github.com/Satish-Kalari/rmodule-aws-sg.git?ref=master"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "mongodb"
    sg_description = "SG for mnagodb" 
    #sg_ingress_rules = var.mongodb_sg_ingress_rules 
}

module "redis" {
    source = "git::https://github.com/Satish-Kalari/rmodule-aws-sg.git?ref=master"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "redis"
    sg_description = "SG for redis" 
    #sg_ingress_rules = var.redis_sg_ingress_rules 
}

module "mysql" {
    source = "git::https://github.com/Satish-Kalari/rmodule-aws-sg.git?ref=master"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "mysql"
    sg_description = "SG for mysql" 
    #sg_ingress_rules = var.mysql_sg_ingress_rules 
}

module "rabbitmq" {
    source = "git::https://github.com/Satish-Kalari/rmodule-aws-sg.git?ref=master"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "rabbitmq"
    sg_description = "SG for rabbitmq" 
    #sg_ingress_rules = var.rabbitmq_sg_ingress_rules 
}

module "catalogue" {
    source = "git::https://github.com/Satish-Kalari/rmodule-aws-sg.git?ref=master"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "catalogue"
    sg_description = "SG for catalogue" 
    #sg_ingress_rules = var.catalogue_sg_ingress_rules 
}

module "user" {
    source = "git::https://github.com/Satish-Kalari/rmodule-aws-sg.git?ref=master"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "user"
    sg_description = "SG for user" 
    #sg_ingress_rules = var.user_sg_ingress_rules 
}

module "cart" {
    source = "git::https://github.com/Satish-Kalari/rmodule-aws-sg.git?ref=master"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "cart"
    sg_description = "SG for cart" 
    #sg_ingress_rules = var.cart_sg_ingress_rules 
}

module "shipping" {
    source = "git::https://github.com/Satish-Kalari/rmodule-aws-sg.git?ref=master"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "shipping"
    sg_description = "SG for shipping" 
    #sg_ingress_rules = var.shipping_sg_ingress_rules 
}

module "payment" {
    source = "git::https://github.com/Satish-Kalari/rmodule-aws-sg.git?ref=master"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "payment"
    sg_description = "SG for payment" 
    #sg_ingress_rules = var.payment_sg_ingress_rules 
}

module "web" {
    source = "git::https://github.com/Satish-Kalari/rmodule-aws-sg.git?ref=master"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "web"
    sg_description = "SG for web" 
    #sg_ingress_rules = var.web_sg_ingress_rules 
}

resource "aws_security_group_rule" "web_internet" {
  cidr_blocks = ["0.0.0.0/0"]
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.web.sg_id
}

#mongodb accepting connections from catalogue instances 
resource "aws_security_group_rule" "mongodb_catalogue" {
  source_security_group_id = module.catalogue.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id 
}

#mongodb accepting connections from user instances 
resource "aws_security_group_rule" "mongodb_user" {
  source_security_group_id = module.user.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id 
}

#redis accepting connections from cart instances 
resource "aws_security_group_rule" "redis_cart" {
  source_security_group_id = module.cart.sg_id
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis.sg_id 
}

#redis accepting connections from user instances 
resource "aws_security_group_rule" "redis_user" {
  source_security_group_id = module.user.sg_id
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis.sg_id 
}

#mysql accepting connections from shipping instances 
resource "aws_security_group_rule" "mysql_shipping" {
  source_security_group_id = module.shipping.sg_id
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = module.mysql.sg_id 
}

#rabbitmq accepting connections from payment instances 
resource "aws_security_group_rule" "rabbitmq_payment" {
  source_security_group_id = module.payment.sg_id
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  security_group_id = module.rabbitmq.sg_id 
}

resource "aws_security_group_rule" "catalogue_cart" {
  source_security_group_id = module.cart.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.catalogue.sg_id
}

resource "aws_security_group_rule" "cart_shipping" {
  source_security_group_id = module.shipping.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

#user accepting connections from payment instances 
resource "aws_security_group_rule" "user_payment" {
  source_security_group_id = module.payment.sg_id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.user.sg_id 
}

resource "aws_security_group_rule" "shipping_web" {
  source_security_group_id = module.web.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.shipping.sg_id
}

resource "aws_security_group_rule" "payment_web" {
  source_security_group_id = module.web.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.payment.sg_id
}

#### DOUBT
# resource "aws_security_group_rule" "catalogue_web" {
#   source_security_group_id = module.web.sg_id
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = module.catalogue.sg_id
# }

# resource "aws_security_group_rule" "user_web" {
#   source_security_group_id = module.web.sg_id
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = module.user.sg_id
# }

# resource "aws_security_group_rule" "cart_web" {
#   source_security_group_id = module.web.sg_id
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = module.cart.sg_id
# }

# #cart accepting connections from payment instances 
# resource "aws_security_group_rule" "cart_payment" {
#   source_security_group_id = module.payment.sg_id
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = module.cart.sg_id  
# }