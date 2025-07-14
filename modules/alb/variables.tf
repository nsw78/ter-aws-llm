variable "subnet_ids" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the ALB"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the target groups"
  type        = string
}

