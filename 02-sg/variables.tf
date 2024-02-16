variable "common_tags" {
    default = {
        Project = "roboshop"
        Environment = "dev"
        terraform = "true"
    }  
}

variable "project_name" {
    default = "roboshop"  
}

variable "environment" {
    default = "dev"  
}

variable "sg_tags" {
    default = {}  
}

variable "mongodb_sg_ingress_rules" {
    default = [
    {
        description      = "Aloow Port 80"
        from_port        = 80 
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]

    },
    {
        description      = "Aloow Port 443"
        from_port        = 443 
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }    
]
} 

variable "modules" {
 description = "List of module details"
 type        = list(object({
   name = string
   description = string
 }))
 default     = [
   {name = "vpn", description = "SG for vpn"},
   {name = "app_alb", description = "SG for web"},
   {name = "mongodb", description = "SG for mongodb"},
   {name = "redis", description = "SG for redis"},
   {name = "mysql", description = "SG for mysql"},
   {name = "rabbitmq", description = "SG for rabbitmq"},
   {name = "catalogue", description = "SG for catalogue"},
   {name = "user", description = "SG for user"},
   {name = "cart", description = "SG for cart"},
   {name = "shipping", description = "SG for shipping"},
   {name = "payment", description = "SG for payment"},
   {name = "web", description = "SG for web"},
 ]
}

variable "services" {
 description = "Map of service names to security group IDs"
 type        = map(string)
 default     = {
    mongodb    = "module.mongodb.sg_id"
    redis      = "module.redis.sg_id"
    mysql      = "module.mysql.sg_id"
    rabbitmq   = "module.rabbitmq.sg_id"
    catalogue = "module.catalogue.sg_id"
    user       = "module.user.sg_id"
    cart       = "module.cart.sg_id"
    shipping   = "module.shipping.sg_id"
    payment    = "module.payment.sg_id"
    web        = "module.web.sg_id"
 }
}

variable "connections" {
 description = "List of module names"
 type        = list(string)
 default     = ["catalogue", "cart", "user", "shipping", "payment"]
}
