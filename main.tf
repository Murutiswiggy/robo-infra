# #vpc
# resource "aws_vpc" "main" {
#   cidr_block       = var.vpc_cidr
#   instance_tenancy = "default"
#   enable_dns_hostnames = true

#   tags = merge(
#      var.vpc_tags,
#      local.common_tags
#   )
    
#   }

# #internetgateway
# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.main.id

#   tags = merge (
#     var.igw_tags,
#     local.common_tags
#   )
# }  

# #subnets
# resource "aws_subnet" "public_sub_1" {
#   count = length(var.pubilc_sub_cidrs)
#   vpc_id     = aws_vpc.main.id
#   cidr_block = var.pubilc_sub_cidrs[count.index]
#   availability_zone = local.az_names[count.index]
#   map_public_ip_on_launch = true

#   tags = merge(
#     var.public_sub_tags,
#     local.common_tags,
#     {
#        Name = "${local.common_name}-public-${split("-", local.az_names[count.index])[2]}"
#     }
#   )
# }

# resource "aws_subnet" "private_sub_1" {
#   count = length(var.private_sub_cidrs)
#   vpc_id     = aws_vpc.main.id
#   cidr_block = var.private_sub_cidrs[count.index]
#   availability_zone = local.az_names[count.index]
#   map_public_ip_on_launch = false

#   tags = merge(
#     var.public_sub_tags,
#     local.common_tags,
#     {
#        Name = "${local.common_name}-private-${split("-", local.az_names[count.index])[2]}"
#     }
#   )
# }

# resource "aws_subnet" "database_sub_1" {
#   count = length(var.database_sub_cidrs)
#   vpc_id     = aws_vpc.main.id
#   cidr_block = var.database_sub_cidrs[count.index]
#   availability_zone = local.az_names[count.index]
#   map_public_ip_on_launch = false

#   tags = merge(
#     var.public_sub_tags,
#     local.common_tags,
#     {
#        Name = "${local.common_name}-database-${split("-", local.az_names[count.index])[2]}"
#     }
#   )
# }


# #route tables
# resource "aws_route_table" "public_route" {
#   vpc_id = aws_vpc.main.id


#   tags = merge(
#     var.route_public_tags,
#     local.common_tags,
#     {
#       Name = "${local.common_name}-public"
#     }
#   )
# }

# resource "aws_route_table" "private_route" {
#   vpc_id = aws_vpc.main.id


#   tags = merge(
#     var.route_private_tags,
#     local.common_tags,
#     {
#       Name = "${local.common_name}-private"
#     }
#   )
# }

# resource "aws_route_table" "database_route" {
#   vpc_id = aws_vpc.main.id


#   tags = merge(
#     var.route_database_tags,
#     local.common_tags,
#     {
#       Name = "${local.common_name}-database"
#     }
#   )
# }


# resource "aws_route_table_association" "public" {
#   count = length(var.pubilc_sub_cidrs)
#   subnet_id      = aws_subnet.public_sub_1[count.index].id
#   route_table_id = aws_route_table.public_route.id
# }

# resource "aws_route_table_association" "private" {
#   count = length(var.private_sub_cidrs)
#   subnet_id      = aws_subnet.private_sub_1[count.index].id
#   route_table_id = aws_route_table.private_route.id
# }

# resource "aws_route_table_association" "databasec" {
#   count = length(var.database_sub_cidrs)
#   subnet_id      = aws_subnet.database_sub_1[count.index].id
#   route_table_id = aws_route_table.database_route.id
# }



# resource "aws_route" "internet_access" {
#   route_table_id         = aws_route_table.public_route.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.gw.id
# }


# #peering
# resource "aws_vpc_peering_connection" "default" {
#   count = var.peering_required ? 1 : 0
#   peer_vpc_id   = data.aws_vpc.default.id
#   auto_accept = true
#   vpc_id        = aws_vpc.main.id

#   accepter {
#     allow_remote_vpc_dns_resolution = true
#   }

#   requester {
#     allow_remote_vpc_dns_resolution = true
#   }

#   tags = merge(
#     var.vpc_peering_tags,
#     local.common_tags,
#     {
#         Name = "${local.common_name}-default"
#     }
#   )
# }


# resource "aws_route" "ppeering_public" {
#   count = var.peering_required ? 1 : 0
#   route_table_id            = aws_route_table.public_route.id
#   destination_cidr_block    = data.aws_vpc.default.cidr_block
#   vpc_peering_connection_id = aws_vpc_peering_connection.default[count.index].id

# }

