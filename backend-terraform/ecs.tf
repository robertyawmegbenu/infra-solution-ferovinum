resource "aws_ecs_cluster" "main" {  
  name = var.cluster_name
}

resource "aws_security_group" "ecs" {
  name_prefix = "ecs-sg-"
  description = "ECS security group" 
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.container_port 
    to_port     = var.container_port 
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]      
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
