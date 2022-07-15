// variable declarations

// provision ec2 instance
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
data "aws_ami" "amazon-linux-2-kernel-5" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5*"]
  }
}

resource "aws_instance" "flask-server" {
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.main.id
  vpc_security_group_ids      = [aws_security_group.flask-app-sg.id]
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  user_data                   = file("${path.module}/user-data.sh")
  monitoring                  = true

  // root disk
  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    delete_on_termination = true
    encrypted             = true
  }
  //  extra disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.data_volume_size
    volume_type           = var.data_volume_type
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = "flask-server"
  }
}

// provision elastic ip address
resource "aws_eip" "flask-eip" {
  vpc = true
  tags = {
    Name = "flask-server-eip"
  }
}
