# General Variables
variable "main_project_tag" {
  description = "Tag that will be attached to all resources."
  type        = string
  default     = "getting-into-consul"
}

variable "aws_default_region" {
  description = "The default region that all resources will be deployed into."
  type        = string
  default     = "us-east-1"
}

# VPC Variables
variable "vpc_cidr" {
  description = "Cidr block for the VPC.  Using a /16 or /20 Subnet Mask is recommended."
  type        = string
  default     = "10.255.0.0/20"
}

variable "vpc_instance_tenancy" {
  description = "Tenancy for instances launched into the VPC."
  type        = string
  default     = "default"
}

variable "vpc_tags" {
  description = "Additional tags to add to the VPC and its resources."
  type        = map(string)
  default     = {}
}

variable "vpc_public_subnet_count" {
  description = "The number of public subnets to create.  Cannot exceed the number of AZs in your selected region.  2 is more than enough."
  type        = number
  default     = 2
}

variable "vpc_private_subnet_count" {
  description = "The number of private subnets to create.  Cannot exceed the number of AZs in your selected region."
  type        = number
  default     = 2
}

# EC2 Variables
variable "ami_id" {
  description = "AMI ID to be used on all AWS EC2 Instances."
  type        = string
  default     = "ami-0747bdcabd34c712a" # Latest Ubuntu 18.04 LTS (HVM), SSD Volume Type
}

variable "ec2_key_pair_name" {
  description = "An existing EC2 key pair used to access the bastion server."
  type        = string
}

## Consul Servers
variable "server_desired_count" {
  description = "The desired number of consul servers.  For Raft elections, should be an odd number."
  type        = number
  default     = 3
}

variable "server_min_count" {
  description = "The minimum number of consul servers."
  type        = number
  default     = 3
}

variable "server_max_count" {
  description = "The maximum number of consul servers."
  type        = number
  default     = 3
}

## Consul Web Clients
variable "client_web_desired_count" {
  description = "The desired number of consul web clients."
  type        = number
  default     = 1
}

variable "client_web_min_count" {
  description = "The minimum number of consul web clients."
  type        = number
  default     = 1
}

variable "client_web_max_count" {
  description = "The maximum number of consul web clients."
  type        = number
  default     = 1
}

variable "client_web_service_token" {
  description = "Service ACL token for web"
  type        = string
  default     = ""
  sensitive   = true
}

## Consul API Clients
variable "client_api_desired_count" {
  description = "The desired number of consul api clients."
  type        = number
  default     = 1
}

variable "client_api_min_count" {
  description = "The minimum number of consul api clients."
  type        = number
  default     = 1
}

variable "client_api_max_count" {
  description = "The maximum number of consul api clients."
  type        = number
  default     = 1
}

variable "client_api_service_token" {
  description = "Service ACL token for API"
  type        = string
  default     = ""
  sensitive   = true
}


# Allowed Traffic into the Bastion
variable "allowed_bastion_cidr_blocks" {
  description = "List of CIDR blocks allowed to access your Bastion.  Defaults to Everywhere."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_bastion_cidr_blocks_ipv6" {
  description = "List of CIDR blocks allowed to access your Bastion.  Defaults to none."
  type        = list(string)
  default     = []
}

# Allowed Traffic into the Consul Server
variable "allowed_traffic_cidr_blocks" {
  description = "List of CIDR blocks allowed to send requests to your consul server endpoint.  Defaults to EVERYWHERE."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_traffic_cidr_blocks_ipv6" {
  description = "List of IPv6 CIDR blocks allowed to send requests to your consul server endpoint.  Defaults to EVERYWHERE."
  type        = list(string)
  default     = ["::/0"]
}

variable "hcp_region" {
  type        = string
  default     = ""
  description = "HCP region"
}


variable "hcp_cidr_block" {
  type        = string
  default     = "172.25.16.0/20"
  description = "CIDR block of the HashiCorp Virtual Network"
}

variable "hcp_vault_public_endpoint" {
  type        = bool
  default     = true
  description = "Enable HCP Vault public endpoint for cluster"
}
