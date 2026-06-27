variable "project" {
   type = string
}

variable "environment" {
    type = string
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_tags" {
  type = map(string)
  default = {}
}

variable "igw_tags" {
  type = map(string)
  default = {}

}



variable "pubilc_sub_cidrs" {
  type = list(string)
  default = [ "10.0.10.0/24", "10.0.20.0/24"]
}

variable "public_sub_tags" {
  type = map(string)
  default = {}
}



variable "private_sub_cidrs" {
    type = list(string)
    default = [ "10.0.30.0/24", "10.0.40.0/24"] 
}

variable "private_sub_tags" {
  type = map(string)
  default = {}
}




variable "database_sub_cidrs" {
  type = list(string)
  default = [ "10.0.50.0/24", "10.0.60.0/24" ]
}

variable "database_sub_tags" {
  type = map(string)
  default = {}
}


variable "route_public_tags" {
  type = map(string)
  default = {}
}


variable "route_private_tags" {
  type = map(string)
  default = {}
}

variable "route_database_tags" {
  type = map(string)
  default = {}
}

variable "peering_required" {
  default = false
  type = bool
}

 variable "vpc_peering_tags" {
   type = map(string)
   default = {}
  
 }

 variable "Security_tags" {
  type = map(string)
  default = {}
  
}

