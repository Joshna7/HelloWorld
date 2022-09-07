# Provisioning VPC, ECS Fagrate, ALB, Autoscaling using Terraform
 Having AWS account and Terraform CLI installed.


## Documentation

Note: created a new branch "release" and performed all the changes in release branch

Containerized the application using AWS ECS Fargate using Terraform

Usage of each file:

alb.tf : created Application Load Balancer with target groups, security group and listener.

auto_scaling.tf : Created autoscaling for the application based on Capacity, Cpu Utilization and Memory

ecs.tf : Created Cluster, Task Definitions and Services and container defenition is defined under templates/ecs folder.

logs.tf : Integrated the cloud watch for monitoring the logs of the application

outputs.tf : To view the output in the console added loadblancer URL

provider.tf : Here the provider i used is AWS

roles.tf : created roles, which will help to associate EC2 instances to clusters, and other tasks.

Security.tf : Created security groups for load balancer and ecs tasks

variables : added the variable which uses in the application

versions.tf : Given the terraform version in this file.

vpc.tf: Created the VPC, Subnets, routing tables, internet gateway .





