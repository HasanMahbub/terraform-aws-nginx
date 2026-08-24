data "aws_ami" "linux" {
  most_recent = true
  owners      = ["137112412989"] # Amazon official account ID

  filter {
    name = "name"
    # This matches the core, standard production-ready Amazon Linux 2023 AMI architectures
    values = ["al2023-ami-202*-x86_64"]
  }
}

