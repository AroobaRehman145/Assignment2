module "networking" {
  source            = "./modules/networking"
  env_prefix        = var.env_prefix
  vpc_cidr_block    = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
}

# 2. Declare the Security Module
module "security" {
  source     = "./modules/security"   # Ensure this folder exists!
  vpc_id     = module.networking.vpc_id
  env_prefix = var.env_prefix
}


# 1. Nginx Web Server (Calling the module once)
module "nginx_server" {
  source            = "./modules/webserver"
  
  env_prefix        = var.env_prefix
  instance_name     = "nginx-proxy"
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  vpc_id            = module.networking.vpc_id
  subnet_id         = module.networking.public_subnet_id
  
  # Corrected: Use 'security_group_id' as defined in the module
  security_group_id = module.security.nginx_sg_id 
  
  public_key        = file(var.public_key_path)
  script_path       = "./scripts/nginx-setup.sh"
  instance_suffix   = "0"
  common_tags       = local.common_tags
}

# 2. Backend Servers (Calling the module using for_each)
module "backend_servers" {
  source   = "./modules/webserver"
  for_each = { for server in local.backend_servers : server.name => server }

  env_prefix        = var.env_prefix
  instance_name     = each.value.name
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  vpc_id            = module.networking.vpc_id
  subnet_id         = module.networking.private_subnet_id
  
  # Corrected: Use 'security_group_id' as defined in the module
  security_group_id = module.security.backend_sg_id
  
  public_key        = file(var.public_key_path)
  script_path       = each.value.script_path
  instance_suffix   = each.value.suffix
  common_tags       = local.common_tags
}