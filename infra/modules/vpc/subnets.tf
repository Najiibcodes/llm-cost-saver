#public

resource "aws_subnet" "llm-public-a" { #public
  vpc_id     = aws_vpc.llm-vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "llm-public-a"
  }
}

resource "aws_subnet" "llm-public-b" { #private
  vpc_id     = aws_vpc.llm-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "llm-public-b"
  }
}

#private
resource "aws_subnet" "llm-private-a" { 
  vpc_id     = aws_vpc.llm-vpc.id
  cidr_block = "10.0.8.0/21"
  availability_zone = "eu-west-2a"
  tags = {
    Name = "llm-private-a"
  }
}

resource "aws_subnet" "llm-private-b" {
  vpc_id     = aws_vpc.llm-vpc.id
  cidr_block = "10.0.16.0/21"
  availability_zone = "eu-west-2b"
  tags = {
    Name = "llm-private-b"
  }
}

