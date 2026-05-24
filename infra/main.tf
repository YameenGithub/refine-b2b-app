locals {
  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

# Apply tags to resources that support them where convenient.