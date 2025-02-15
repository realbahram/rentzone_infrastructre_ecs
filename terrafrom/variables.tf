# Environment Variables
variable "region" {
    description = "region to create resources"
    type        = string
}

variable "project_name" {
    description = "your project name"
    type        = string
}

variable "environment" {
    description = "your environment"
    type        = string
}

# VPC variables
variable "vpc_cidr" {
    description = "your vpc cidr block"
    type        = string
}

variable "public_subnet_az1_cidr" {
    description = "your public subnet az1 cidr block"
    type        = string
}

variable "public_subnet_az2_cidr" {
    description = "your public subnet az2 cidr block"
    type        = string
}

variable "private_app_subnet_az1_cidr" {
    description = "your private app subnet az1 cidr block"
    type        = string
}

variable "private_app_subnet_az2_cidr" {
    description = "your private app subnet az2 cidr block"
    type        = string
}

variable "private_data_subnet_az1_cidr" {
    description = "your private data subnet az1 cidr block"
    type        = string
}

variable "private_data_subnet_az2_cidr" {
    description = "your private data subnet az2 cidr block"
    type        = string
}

# Security-Groups Variables
variable "ssh_location" {
    description = "your IP addressed used for ssh into server"
    type        = string
}

# RDS variables
variable "database_snapshot_identifier" {
    description = "your database snapshot name"
    type        = string
}

variable "database_instance_class" {
    description = "your database instance type"
    type        = string
}

variable "database_instance_identifier" {
    description = "your database instance identifier"
    type        = string
}

variable "multi_az_deployment" {
    description = "your create a standby db instance"
    type        = bool
}

# ACM variables
variable "domain_name" {
    description = "your domain name"
    type        = string
}

variable "alternative_names" {
    description = "your sub domain name for ACM"
    type        = string
}

#s3 Variables
variable "env_file_bucket_name" {
    description = "your S3 bucket name"
    type        = string
}

variable "env_file_name" {
    description = "your env file name"
    type        = string
}

#ECS Variables
variable "architecture" {
    description = "your ecs cpu architecture"
    type        = string
}

variable "container_image" {
    description = "your container image uri"
    type        = string
}

#Route 53 Variables
variable "record_name" {
    description = "your sub domain name for Route 53"
    type        = string
}