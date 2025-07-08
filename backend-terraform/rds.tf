data "aws_secretsmanager_secret" "db_secret" {
  name = var.db_secret_name
}

data "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id = data.aws_secretsmanager_secret.db_secret.id
}

locals {
  db_credentials = jsondecode(data.aws_secretsmanager_secret_version.db_secret_version.secret_string)
}


# RDS MySQL Aurora Instance
resource "aws_db_instance" "ferovinium_instance" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  identifier             = "feroviniumdb"
  db_name                = var.db_name
  username               = local.db_credentials["username"]
  password               = local.db_credentials["password"]
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.ferovinium_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.ferovinium_subnet_group.name

  backup_retention_period = 7
  multi_az                = false
  auto_minor_version_upgrade = true
  deletion_protection     = false
  skip_final_snapshot     = true
  
}

# Subnet Group for RDS
resource "aws_db_subnet_group" "ferovinium_subnet_group" {
  name       = "ferovinium-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "ferovinium-db-subnet-group"
  }
}
