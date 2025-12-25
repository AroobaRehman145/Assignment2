# 1. Create a unique SSH Key Pair for each instance
resource "aws_key_pair" "ssh_key" {
  key_name   = "${var.instance_name}-key-${var.instance_suffix}"
  public_key = var.public_key
}

# 2. Find the latest Amazon Linux 2023 AMI
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

# 3. Create the EC2 Instance
resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.latest_amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  availability_zone           = var.availability_zone
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ssh_key.key_name

  # Run the script provided in locals.tf
  user_data = file(var.script_path)

  tags = merge(var.common_tags, {
    Name = "${var.env_prefix}-${var.instance_name}-${var.instance_suffix}"
  })
}