variable "aws_region" {
  type        = string
  description = "The aws region to deploy infrastructure into"
  default     = "ap-southeast-1"
}

variable "instance_type" {
  type        = string
  description = "the size of the EC2 Instance"
  default     = "t3.micro"
}

variable "server_name" {
  type        = string
  description = "value for the name tage of the EC2 Instance"
  default     = "Nginx-Web-Server"

}
