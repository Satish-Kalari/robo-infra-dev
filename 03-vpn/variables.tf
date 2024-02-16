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