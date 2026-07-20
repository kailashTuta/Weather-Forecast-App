aws_region        = "ap-south-1"
instance_name     = "my-ec2-instance"
ami_id            = "ami-0b910d1016287a5e7"
instance_type     = "t2.micro"
key_name          = "Docker-RSA"
security_group_id = "sg-055c83ba66680b4bb"

root_volume_size_gb = 8

tags = {
  Environment = "dev"
  Project     = "weather-forecast-app"
}
