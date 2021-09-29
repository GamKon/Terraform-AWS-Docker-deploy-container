resource "aws_vpc" "vpc-for-my-progect" {
  cidr_block   = var.vpc_cidr_block
  tags = merge ( var.tags_common, { Name : "${var.project_name}-${var.project_environment}-vpc" } )
}

resource "aws_subnet" "subnet-for-my-project" {
  vpc_id            = aws_vpc.vpc-for-my-progect.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.az_project_in
  tags      = merge ( var.tags_common, { Name : "${var.project_name}-${var.project_environment}-subnet-1" } )
}

resource "aws_internet_gateway" "igw-for-my-project" {
  vpc_id  = aws_vpc.vpc-for-my-progect.id  
  tags    = merge ( var.tags_common, { Name : "${var.project_name}-${var.project_environment}-internet-gw" } )
}

resource "aws_route_table" "route-table-for-my-project" {
  vpc_id        = aws_vpc.vpc-for-my-progect.id
  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.igw-for-my-project.id
  }
  tags = merge ( var.tags_common, { Name : "${var.project_name}-${var.project_environment}-route-table" } )
}

resource "aws_route_table_association" "route-table-assoc-for-my-project" {
  subnet_id       = aws_subnet.subnet-for-my-project.id
  route_table_id  = aws_route_table.route-table-for-my-project.id
}