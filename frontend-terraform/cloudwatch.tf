resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/ferovinum-backend-app"        
  retention_in_days = 30
}
