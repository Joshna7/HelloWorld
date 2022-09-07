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


## CI/CD Steps

We can use git Actions to perform the CI/CD steps. Here is the example below


```
     - name: build docker image and push to ecr repo
       run: |
          $(aws ecr get-login --no-include-email --region ap-south-1)
          docker build -t ${{ secrets.ECR_REPO_NAME }}/webapp:${{ env.RELEASE_VERSION  }} .
          docker push ${{ secrets.ECR_REPO_NAME }}/webapp:${{ env.RELEASE_VERSION }}
       env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          
     - name: terraform initialization 
       run: cd terraform/ && terraform init 
     - name: terraform deployment
       run: cd terraform/ && terraform apply -var="tag=${{ env.RELEASE_VERSION }}"  -auto-approve

```

We can also use Jenkins to perfom the CI/CD task.





