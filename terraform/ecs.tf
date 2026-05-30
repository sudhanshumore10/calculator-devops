############################
# ECS Cluster
############################

resource "aws_ecs_cluster" "calculator_cluster" {
  name = "calculator-ecs-cluster"

  tags = {
    Name = "calculator-ecs-cluster"
  }
}

############################
# ECS Optimized AMI
############################

data "aws_ami" "ecs_optimized" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
  }
}

############################
# ECS EC2 Node
############################

resource "aws_instance" "ecs_node" {
  ami                    = data.aws_ami.ecs_optimized.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ecs_sg.id]
  key_name               = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.ecs_instance_profile.name

  associate_public_ip_address = true

  user_data = <<-EOF
#!/bin/bash
echo "ECS_CLUSTER=${aws_ecs_cluster.calculator_cluster.name}" >> /etc/ecs/ecs.config
EOF

  tags = {
    Name = "ecs-node"
  }
}
resource "aws_ecs_task_definition" "calculator_task" {
  family                   = "calculator-task"
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "calculator-container"
      image     = "${aws_ecr_repository.calculator_repo.repository_url}:latest"
      essential = true

      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        }
      ]
    }
  ])
}
resource "aws_ecs_service" "calculator_service" {
  name            = "calculator-service"
  cluster         = aws_ecs_cluster.calculator_cluster.id
  task_definition = aws_ecs_task_definition.calculator_task.arn
  desired_count   = 1
  launch_type     = "EC2"

  depends_on = [
    aws_instance.ecs_node
  ]
}