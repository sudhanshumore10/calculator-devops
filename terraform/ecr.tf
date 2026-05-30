resource "aws_ecr_repository" "calculator_repo" {
  name = "calculator-repo"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "calculator-ecr"
  }
}
