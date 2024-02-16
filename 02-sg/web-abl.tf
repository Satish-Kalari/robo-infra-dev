#alb=application load balancer for WEB
module "web_alb" {
    source = "git::https://github.com/Satish-Kalari/rmodule-aws-sg.git?ref=master"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "web_alb"
    sg_description = "SG for WEB ALB" 
    #sg_ingress_rules = var.web_sg_ingress_rules 
}

resource "aws_security_group_rule" "web_alb_internet" {
  cidr_blocks = ["0.0.0.0/0"]
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = module.web_alb.sg_id
}
