#Define the area.
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

#an example of ami
variable "ami_id" {
  description = "instance_ami_id"
  type        = string
  default     = "ami-0bb4c991fa89d4b9b"
}

#establish instance type
variable "instance_project" {
  description = "instance_type"
  type        = string
  default     = "t2.micro"
}

#define s3
variable "bucketname" {
  description = "private_jenkins"
  type        = string
  default     = "private-jenkins-project0303"
}

#establish the VPC id
variable "vpc_id" {
  description = "jenkins_vpc_id"
  type        = string
  default     = "vpc-0c48a1188ad4aefea"
}

#establish a key pair
variable "key_pair" {
  description = "key_pair"
  type        = string
  default     = "Dockerkeypair"
}