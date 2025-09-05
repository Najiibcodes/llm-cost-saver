resource "aws_internet_gateway" "llm-igw" {
  vpc_id = aws_vpc.llm-vpc.id

  tags = {
    Name = "llm-igw"
  }
}