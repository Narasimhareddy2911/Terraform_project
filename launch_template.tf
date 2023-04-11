terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0" # it means version greater than 4.0
    }
  }

  backend "s3" {
    bucket = "terraform-card-site-project-10apr"
    key = "terraform.tfstate"
    region = "ap-south-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# launch templlate for instance

resource "aws_launch_template" "card-app-LT" {
  name = "card-app-LT"
  block_device_mappings {
    device_name = "/dev/sdf"
    ebs {
      volume_size = 8
    }
  }

  image_id = var.image_id
  instance_type = var.instance_type

  key_name = aws_key_pair.card-app-key-pair.id
  vpc_security_group_ids = [aws_security_group.allow_SG.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "card-app"
    }
  }
  user_data = filebase64("input.sh")
}

# Auto scaling group

resource "aws_autoscaling_group" "card-app-ASG" {

  desired_capacity   = 2
  max_size           = 5
  min_size           = 2
  vpc_zone_identifier = [aws_subnet.card-app-SN-1a.id,aws_subnet.card-app-SN-1b.id]
  # if we restrict vpc_zone_identifier to our required subnet's the instances will be created in those subnet's
  target_group_arns = [aws_lb_target_group.card-app-TG.arn]

  launch_template {
    id      = aws_launch_template.card-app-LT.id
    version = "$Latest"
  }
}

