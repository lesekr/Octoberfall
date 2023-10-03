#establish the EC2 instance.
resource "aws_instance" "octjenkins23" {
  ami           = var.ami_id
  instance_type = var.instance_project
  user_data     = file("jenkins_load.sh")

  tags = {
    name = "instance jenkins"
  }
  vpc_security_group_ids = [aws_security_group.the_20_project_sg.id]
}
#form a security group.
resource "aws_security_group" "the_20_project_sg" {
  name   = "allow_tls_and_ssh"
  vpc_id = var.vpc_id

  ingress {
    description = "from VPC"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH into instance"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls_and_ssh"
  }
}

#create s3 bucket
resource "aws_s3_bucket" "ivoireebucket23" {
  bucket = var.bucketname

  tags = {
    Name        = "iovireebucket23"
    Environment = "project_23"
  }
}