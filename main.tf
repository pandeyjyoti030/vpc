#VPC
resource "aws_vpc" "jyo-vpc" {
  cidr_block = "172.16.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "jyo-vpc"
    Owner = "jyoti.pandey@cloudeq.com"
    Purpose = "training"
  }
}

#SUBNET-1
resource "aws_subnet" "jyo-subnet-1" {
  vpc_id = "${aws_vpc.jyo-vpc.id}"
  cidr_block = "172.16.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    Name = "jyo-subnet-1"
    Owner = "jyoti.pandey@cloudeq.com"
    Purpose = "training"
  }
}

#SUBNET-2
resource "aws_subnet" "jyo-subnet-2" {
  vpc_id = "${aws_vpc.jyo-vpc.id}"
  cidr_block = "172.16.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    Name = "jyo-subnet-2"
    Owner = "jyoti.pandey@cloudeq.com"
    Purpose = "training"
  }
}

#INSTANCES FOR SUBNET-1
resource "aws_instance" "jyo-ec2-1" {
  ami = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.jyo-security.id}"]
  subnet_id = "${aws_subnet.jyo-subnet-1.id}"

  count = 2
  associate_public_ip_address = true
  tags = {
    Name = "jyo-ec2-1"
    Owner = "jyoti.pandey@cloudeq.com"
    Purpose = "training"
  }

  volume_tags = {
    Name = "jyo-ec2-1"
    Owner = "jyoti.pandey@cloudeq.com"
    Purpose = "training"
  }
}



#INSTANCES FOR SUBNET-2
resource "aws_instance" "jyo-ec2-2" {
  ami = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.jyo-security.id}"]
  subnet_id = "${aws_subnet.jyo-subnet-2.id}"

  count = 2
  associate_public_ip_address = true
  tags = {
    Name = "jyo-ec2-2"
    Owner = "jyoti.pandey@cloudeq.com"
    Purpose = "training"
  }

  volume_tags = {
    Name = "jyo-ec2-2"
    Owner = "jyoti.pandey@cloudeq.com"
    Purpose = "training"
  }
}

