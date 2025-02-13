# Environment Variables
variable "region" {
    description = "region to create resources"
    type        = string
}

variable "project_name" {
    description = "project name"
    type        = string
}

variable "environment" {
    description = "environment"
    type        = string
}

# VPC variables
variable "vpc_cidr" {
    description = "vpc cidr block"
    type        = string
}

variable "public_subnet_az1_cidr" {
    description = "public subnet az1 cidr block"
    type        = string
}

variable "public_subnet_az2_cidr" {
    description = "public subnet az2 cidr block"
    type        = string
}

variable "private_app_subnet_az1_cidr" {
    description = "private app subnet az1 cidr block"
    type        = string
}

variable "private_app_subnet_az2_cidr" {
    description = "private app subnet az2 cidr block"
    type        = string
}

variable "private_data_subnet_az1_cidr" {
    description = "private data subnet az1 cidr block"
    type        = string
}

variable "private_data_subnet_az2_cidr" {
    description = "private data subnet az2 cidr block"
    type        = string
}

# Security-Groups Variables
variable "ssh_location" {
    description = "IP addressed used for ssh into server"
    type        = string
}

# RDS variables
variable "database_snapshot_identifier" {
    description = "database snapshot name"
    type        = string
}

variable "database_instance_class" {
    description = "database instance type"
    type        = string
}

variable "database_instance_identifier" {
    description = "database instance identifier"
    type        = string
}

variable "multi_az_deployment" {
    description = "create a standby db instance"
    type        = bool
}

# ACM variables
variable "domain_name" {
    description = "domain name"
    type        = string
}

variable "alternative_names" {
    description = "sub domain name"
    type        = string
}

#s3 Variables
variable "env_file_bucket_name" {
    description = "s3 bucket name"
    type        = string
}

variable "env_file_name" {
    description = "env file name"
    type        = string
}

#ECS Variables
variable "architecture" {
    description = "ecs cpu architecture"
    type        = string
}

variable "container_image" {
    description = "container image uri"
    type        = string
}

#Route 53 Variables
variable "record_name" {
    description = "sub domain name"
    type        = string
}