resource "aws_cloudwatch_log_group" "this" {
  name              = "/ecs/${var.project_name}-${var.environment}"
  retention_in_days = 7
}

resource "aws_security_group" "ecs_task" {
  name        = "${var.project_name}-${var.environment}-ecs-task-sg"
  description = "Allow inbound from ALB"
  vpc_id      = aws_vpc.this.id

  ingress {
    from_port       = var.container_port
    to_port         = var.container_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}