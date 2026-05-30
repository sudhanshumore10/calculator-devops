resource "aws_instance" "sonar" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type_sonar
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sonar_sg.id]
  key_name               = var.key_name

  associate_public_ip_address = true

  root_block_device {
    volume_size = 20
  }

  tags = {
    Name = "sonarqube-server"
  }
}