resource "aws_instance" "ec2-ejer01" {
  ami = "ami-08ca34765894576bb"
  instance_type = "t3a.small"
  key_name = "philippine"
  subnet_id = aws_subnet.vpc-nicolai-pub-subnet-a.id
  vpc_security_group_ids = ["${aws_security_group.vpc-nicolai-sg-ejer01.id}"]
  associate_public_ip_address = true
  iam_instance_profile = "${aws_iam_instance_profile.ssm-instance-profile.id}"
  tags = {
    Name = "ejer01"
  }
  credit_specification {
    cpu_credits = "standard"
  }
  root_block_device {                                             
    delete_on_termination = true                                
    iops                  = 100                                 
    volume_size           = 16                                 
    volume_type           = "gp2"                               
  }
}

resource "aws_eip" "eip-ejer01" {
  vpc      = true
  instance = "${aws_instance.ec2-ejer01.id}"
}

resource "aws_security_group" "vpc-nicolai-sg-ejer01" {
  name = "vpc-nicolai-sg-ejer01"
  description = "vpc-nicolai-sg-ejer01"
  vpc_id = aws_vpc.vpc-nicolai.id

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

