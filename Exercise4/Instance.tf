
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

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = var.webuser
    private_key = file("deployer_key")
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

}