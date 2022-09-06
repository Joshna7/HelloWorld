# Provisioning VPC, ECS Fagrate, ALB, Autoscaling using Terraform
 Having AWS account and Terraform CLI installed.


## Documentation

Note: created a new branch "release" and performed all the changes in release branch

Containerized the application using AWS ECS Fargate using Terraform

Usage of each file:

alb.tf : created Application Load Balancer with target groups, security group and listener.
auto_scaling.tf : Created autoscaling for the application based on Capacity, Cpu Utilization and Memory
ecs.tf





