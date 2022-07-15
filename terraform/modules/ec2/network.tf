// provision a vpc

resource "aws_vpc" "flask-app-vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.flask-app-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Flask app subnet"
  }
}
