resource "aws_route_table" "llm-public-rt" {
  vpc_id = aws_vpc.llm-vpc.id

  tags = {
    Name = "llm-public-rt"
  }
}

resource "aws_route" "llm-public-route" {
  route_table_id         = aws_route_table.llm-public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.llm-igw.id
}





resource "aws_route_table" "llm-private-rt" {
  vpc_id = aws_vpc.llm-vpc.id

  tags = {
    Name = "llm-private-rt"
  }
}


#public rta
resource "aws_route_table_association" "llm-public-rt-association-a" {
  subnet_id      = aws_subnet.llm-public-a.id
  route_table_id = aws_route_table.llm-public-rt.id
}


resource "aws_route_table_association" "llm-public-rt-association-b" {
  subnet_id      = aws_subnet.llm-public-b.id
  route_table_id = aws_route_table.llm-public-rt.id
}


#priv rta

resource "aws_route_table_association" "llm-private-rt-association-a" {
  subnet_id      = aws_subnet.llm-private-a.id
  route_table_id = aws_route_table.llm-private-rt.id
}


resource "aws_route_table_association" "llm-private-rt-association-b" {
  subnet_id      = aws_subnet.llm-private-b.id
  route_table_id = aws_route_table.llm-private-rt.id
}