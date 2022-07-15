// variables

variable "aws_access_key" {
  type        = string
  description = "AWS access key"
}
variable "aws_secret_key" {
  type        = string
  description = "AWS secret key"
}
variable "aws_region" {
  type        = string
  description = "AWS region"
}
variable "instance_type" {
  type        = string
  description = "EC2 instance type for Linux Server"
  default     = "t2.micro"
}
variable "associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address to the EC2 instance"
  default     = true
}
variable "root_volume_size" {
  type        = number
  description = "Volume size of root volumen of Linux Server"
}
variable "data_volume_size" {
  type        = number
  description = "Volume size of data volumen of Linux Server"
}
variable "root_volume_type" {
  type        = string
  description = "Volume type of root volumen of Linux Server."
  default     = "gp2"
}
variable "data_volume_type" {
  type        = string
  description = "Volume type of data volumen of Linux Server"
  default     = "gp2"
}
variable "key_name" {
  type        = string
  description = "Name of the key pair"
}
variable "vpc_cidr" {
  type        = string
  description = "CIDR for the VPC"
  default     = "10.0.0.0/16"
}
