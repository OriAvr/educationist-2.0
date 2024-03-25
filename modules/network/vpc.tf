module "my_vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc"
  name   = var.name
  cidr   = var.cidr

  azs              = var.azs
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets
  database_subnets = var.database_subnets

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az

  enable_vpn_gateway        = false
  enable_flow_log           = true
  flow_log_destination_type = "s3"
  flow_log_destination_arn  = var.flow_logs_bucket_arn

  tags = var.tags
}

# S3 VPC Endpoint
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = module.my_vpc.vpc_id
  service_name      = "com.amazonaws.${var.s3_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = module.my_vpc.private_route_table_ids

}


/*
# VPC
resource "aws_vpc" "this" {
  cidr_block           = var.cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = merge(
    { "Name" = var.name },
    var.tags,
    var.vpc_tags,
  )
}

# Subnets
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.azs[0]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(
    {
      "Name" = "${var.name}-public"
    },
    var.tags
  )
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.azs[1]

  tags = merge(
    {
      "Name" = "${var.name}-private"
    },
    var.tags
  )
}

resource "aws_subnet" "database" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.database_subnet_cidr
  availability_zone = var.azs[2]

  tags = merge(
    {
      "Name" = "${var.name}-database"
    },
    var.tags
  )
}

# Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name}-igw"
  }
}

# NAT Gateways
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${var.name}-nat-eip"
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "${var.name}-nat-gateway"
  }

  depends_on = [aws_internet_gateway.this]
}

# Route Tables and Routes
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name}-public-rt"
  }
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name}-private-rt"
  }
}

resource "aws_route" "private_nat_access" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

# Optional, if you want the database subnet to have internet access
resource "aws_route_table" "database" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name}-database-rt"
  }
}

resource "aws_route" "database_nat_access" {
  route_table_id         = aws_route_table.database.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}

resource "aws_route_table_association" "database" {
  subnet_id      = aws_subnet.database.id
  route_table_id = aws_route_table.database.id
}


# Network ACLs
resource "aws_network_acl" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name}-public-nacl"
  }
}

# Inbound rule: Allow all inbound traffic
resource "aws_network_acl_rule" "public_inbound" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

# Outbound rule: Allow all outbound traffic
resource "aws_network_acl_rule" "public_outbound" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name}-private-nacl"
  }
}

# Allow inbound traffic from the VPC itself
resource "aws_network_acl_rule" "private_inbound_allow" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  protocol       = "-1"     # All protocols
  cidr_block     = var.cidr # Use your VPC's CIDR block
  from_port      = 0
  to_port        = 0
}

# Allow all outbound traffic
resource "aws_network_acl_rule" "private_outbound" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  protocol       = "-1" # All protocols
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}


# S3 VPC Endpoint
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.this.id
  service_name      = "com.amazonaws.${var.s3_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids = [
    aws_route_table.private.id,
  ]
}


*/
