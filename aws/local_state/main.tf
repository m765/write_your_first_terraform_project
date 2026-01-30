# This data source finds the latest Amazon Linux 2023 AMI
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-6.1-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.latest_amazon_linux.id # Use the dynamically found ID
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Demo"
  }
}
