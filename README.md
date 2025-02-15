# Deploying a Dynamic Web Application on AWS with Terraform, Docker, Amazon ECR, and ECS
This repository provides Terraform modules to deploy and host a dynamic web application on Amazon Web Services (AWS) using an infrastructure-as-code (IaC) approach. The project integrates several powerful technologies to create a scalable, secure, and reproducible infrastructure:
![alt text](<image/Blank diagram (1).png>)

**Terraform:** Automates the provisioning and management of AWS resources, ensuring consistency and reproducibility.

**Docker:** Packages the web application and its dependencies into a portable container image.

**Amazon ECR (Elastic Container Registry):** Stores and manages Docker images securely.

**Amazon ECS (Elastic Container Service):** Orchestrates the deployment and scaling of containerized applications across a cluster of EC2 instances.

**AWS Secrets Manager:** Securely stores and manages sensitive information, such as RDS database credentials.

## Key Features
**Automated Infrastructure:** Terraform defines and manages AWS resources, including VPCs, subnets, security groups, load balancers, ECS clusters, and more.

**Containerized Application:** Docker encapsulates the web application, making it platform-independent and easy to deploy.

**Scalable and Reliable:** ECS enables dynamic scaling based on demand, ensuring high availability and performance.

**Secure Deployment:** ECR provides a private registry for Docker images, and Secrets Manager securely stores RDS credentials.

**Reproducible Environment:** The entire infrastructure and application deployment are codified in Terraform, enabling easy replication and disaster recovery.

## Benefits
**Simplified Deployment:** Streamlines the deployment of complex web applications on AWS.

**Increased Agility:** Facilitates rapid iteration and updates to the application and infrastructure.

**Reduced Operational Overhead:** Automates infrastructure management, saving time and resources.

**Improved Consistency:** Ensures consistent deployments across environments (development, staging, production).

**Enhanced Security:** Leverages AWS security best practices, including Secrets Manager for secure credential management.

## Architecture Overview
The dynamic web application is deployed on AWS using Terraform, Docker, ECR, and ECS. The architecture includes:

### Virtual Private Cloud (VPC)
A secure and scalable VPC with public and private subnets across two Availability Zones (AZs) for fault tolerance and high availability.

**Note:** The multi_az_deployment variable in terraform.tfvars is set to false, meaning the database resides in a single AZ. If that AZ experiences an outage, the database will become unavailable.

### Subnets
**Public Subnets:** Host internet-facing resources like the Application Load Balancer (ALB) and NAT Gateways.

**Private Subnets:** Host internal resources like the ECS cluster and RDS database, enhancing security.

### Internet Gateway
Enables communication between resources in the VPC and the internet.

### NAT Gateways
Allow resources in private subnets to access the internet without direct exposure.

### Security Groups
Act as virtual firewalls to control inbound and outbound traffic.

### Application Load Balancer (ALB)
Distributes incoming web traffic across ECS tasks, ensuring high availability and fault tolerance. Configured with listeners for HTTP/HTTPS (ports 80/443) and continuous health monitoring.

### Amazon ECS (Elastic Container Service)
Manages the deployment, scaling, and operation of containerized applications.

**ECS Cluster:** Logical grouping of ECS container instances hosting the application.

**ECS Task Definitions:** Blueprints defining the Docker image, resource requirements, and configurations (e.g., IAM roles).

**ECS Services:** Manage the launch and scaling of tasks based on task definitions.

### Amazon ECR (Elastic Container Registry)
Stores, manages, and deploys Docker container images securely.

### Amazon RDS (Relational Database Service)
A managed relational database service for setting up, operating, and scaling databases in the cloud. Uses snapshots for disaster recovery, testing, development, and compliance.

### AWS Secrets Manager
Securely stores and manages RDS database credentials, ensuring sensitive information is not hardcoded in the Terraform code or state file.

### AWS Certificate Manager (ACM)
Manages SSL/TLS certificates for secure communication.

### Amazon Route 53
A scalable DNS web service used to map the domain name (e.g., spaceadoo.com) to the load balancer.

## Terraform Files and Their Functions
Here’s an overview of the key Terraform files in this project:

acm.tf: Requests and validates SSL/TLS certificates using AWS Certificate Manager (ACM).

alb.tf: Creates the Application Load Balancer (ALB), target groups, and listeners.

asg.tf: Sets up the Auto Scaling group for ECS tasks based on CPU utilization.

backend.tf: Configures the Terraform backend to store the state file in an S3 bucket and lock it with DynamoDB.

ecs-role.tf: Defines IAM roles and policies for ECS tasks.

ecs.tf: Creates the ECS cluster, task definitions, and services.

nat-gateway.tf: Provisions NAT Gateways in public subnets.

output.tf: Defines outputs like the website URL.

providers.tf: Configures the AWS provider with the region and default tags.

rds.tf: Creates the RDS database instance and associated resources.

route-53.tf: Creates Route 53 records to map the domain name to the load balancer.

s3.tf: Creates an S3 bucket to store the environment file for the application.

security-groups.tf: Defines security groups for controlling traffic.

terraform.tfvars: Contains variable values for the Terraform configuration.

variables.tf: Declares variables used in the Terraform configuration.

vpc.tf: Creates the VPC, subnets, internet gateway, and route tables.

## How to Use
Follow these steps to deploy the dynamic web application infrastructure:

## Prerequisites
An AWS account with appropriate permissions.

Terraform installed on your local machine. Download it from the official website.

Configure your AWS credentials using environment variables (AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY) or an AWS credentials file.

## Deployment Steps

**Clone the Repository:**
'''
git clone https://github.com/adoomabd/AdamAbdelrahim-Terraform-ECS-Project.git
'''
**Navigate to the Project Directory:**

'''
cd AdamAbdelrahim-Terraform-ECS-Project
'''

**Initialize Terraform**:
'''
terraform init
'''

**Review the Terraform Plan:**

'''
terraform plan
'''
**Apply the Configuration:**
'''
terraform apply
'''
Confirm the changes by typing yes when prompted.

**Access the Application:**
After deployment, access the web application using the Application Load Balancer’s DNS name provided in the Terraform output.

## Additional Notes
Customize the deployment by modifying variables in terraform.tfvars.

Pay attention to capitalization (e.g., "TCP" vs. "tcp").

Refer to comments in .tf files for guidance on specific Terraform functions and modules.

To destroy the infrastructure and clean up resources, run:

'''
terraform destroy
'''


Credits
Special thanks to **AOSNotes** for their assistance in completing this project.

