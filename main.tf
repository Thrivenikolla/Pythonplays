# Launch single Ec2 instance in us-east-1 
provider "aws"{
    region = "us-east-1"
}

data "aws_ami" "amazon_linux" {
    most_recent = true

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
    owners = ["1234567897"]
}

resource "aws_instance" "new_instance" {
    ami = "data.aws_ami.amazon_linux.id"
    instance_type = "t2.micro"

    tags = {
        Name = "Basic_instance"
    }
}

#vpc+subnet+Ec2
provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "vpcforec2" {
    cidr_block = "10.0.0.0/16"
    tags = {
        name = "vpcforec2"
    }
}

resource "aws_subnet" "subnetforec2"{
    vpc_id = aws_vpc.vpcforec2.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
        name = "subnetforec2"
    }
}

resource "aws_internet_gateway" "igwforec2" {
    vpc_id = aws_vpc.vpcforec2.id
    tags = {
        name = "igwforec2"
    }
}

resource "aws_route_table" "rtforec2"{
    vpc_id = aws_vpc.vpcforec2.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igwforec2.id
    }
    tags = {
        name = "RTforec2"
    }
}

resource "aws_route_table_association" "RTassociation" {
    subnet_id = aws_subnet.subnetforec2.id
    route_table_id = aws_route_table.rtforec2.id
}

resource "aws_security_group" "my_sg" {
    name = "allow_ssh"
    description = "allow_ssh"
    vpc_id = aws_vpc.vpcforec2.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        name = "SGforec2"
    }
}

data "aws_ami" "amazon_linux" {
    most_recent = true

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
    owners = ["1234567897"]
}

resource "aws_instance" "new_instance" {
    ami = "data.aws_ami.amazon_linux.id"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.subnetforec2.id
    vpc_security_group_ids = [aws_security_group.my_sg.id]

    tags = {
        Name = "EC2_instance"
    }
}


# variables+outputs
variable "instance_type" {
    description = "Type of EC2 instance"
    default = "t2.micro"
}
variable "aws_region" {
    description = "region of EC2 instance"
    default = "us-east-1"
}

provider "aws" {
    region = var.aws_region
}

data "aws_ami" "amazon_linux" {
    most_recent = true

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
    owners = ["1234567897"]
}

resource "aws_instance" "new_instance" {
    ami = "data.aws_ami.amazon_linux.id"
    instance_type = var.instance_type

    tags = {
        Name = "EC2_instance"
    }
}

#output

output "instance_public_ip" {
    description = "publicip of created instance"
    value = aws_instance.new_instance.public_ip
}