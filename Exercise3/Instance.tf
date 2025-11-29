
resource "aws_instance" "web" {
  ami                    = var.amiID[var.region]
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.deployer_key.key_name
  vpc_security_group_ids = [aws_security_group.deploy-sg.id]
  availability_zone      = var.zone1

  tags = {
    Name    = "deploy_instance"
    Project = "deploy"
  }
}