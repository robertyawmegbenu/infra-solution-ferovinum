terraform {
  backend "s3" {
    bucket         = "ferovinum-s3-bucket-1"
    key            = "terraform_statefile"   
    region         = "eu-west-1"
    use_lockfile   = true 
  }
}
