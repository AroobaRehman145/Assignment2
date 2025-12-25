locals {
  # 1. Dynamic IP detection for security groups
  my_ip = "${chomp(data.http.my_ip.response_body)}/32"
  
  # 2. Resource naming conventions & Common tags
  common_tags = {
    Environment = var.env_prefix
    Project     = "Lab12-Assignment"
    ManagedBy   = "Terraform"
  }
  
  # 3. Backend server configurations
  backend_servers = [
    {
      name        = "web-1"
      suffix      = "1"
      script_path = "./scripts/apache-setup.sh"
          },
    {
      name        = "web-2"
      suffix      = "2"
      script_path = "./scripts/apache-setup.sh"
    },
    {
      name        = "web-3"
      suffix      = "3"
      script_path = "./scripts/apache-setup.sh"
    }
  ]
}

# Data source to fetch your current public IP address
data "http" "my_ip" {
  url = "http://ifconfig.me/ip"
}