
resource "aws_instance" "web" {
  ami                    = data.aws_ami.amiID.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.deployer_key.key_name
  vpc_security_group_ids = [aws_security_group.deploy-sg.id]
  availability_zone      = "us-east-1a"

  tags = {
    Name    = "deploy_instance"
    Project = "deploy"
  }
}