#!/bin/sh
echo "Loading the paramaters for the template..."
SUBNET1=`aws cloudformation describe-stacks --stack-name devops-capstone-network --query "Stacks[0].Outputs[?OutputKey=='Subnet1'].OutputValue" --output text --profile udacity`
echo "SUBNET1=$SUBNET1"
SUBNET2=`aws cloudformation describe-stacks --stack-name devops-capstone-network --query "Stacks[0].Outputs[?OutputKey=='Subnet2'].OutputValue" --output text --profile udacity`
echo "SUBNET2=$SUBNET2"
SECURITY_GROUP=`aws cloudformation describe-stacks --stack-name devops-capstone-network --query "Stacks[0].Outputs[?OutputKey=='SecurityGroup'].OutputValue" --output text --profile udacity`
echo "SECURITY_GROUP=$SECURITY_GROUP"
VPC=`aws cloudformation describe-stacks --stack-name devops-capstone-network --query "Stacks[0].Outputs[?OutputKey=='Vpc'].OutputValue" --output text --profile udacity`
echo "VPC=$VPC"

echo "Deploying the stack..."
aws cloudformation deploy --stack-name devops-capstone-eks --template-file eks.yml \
    --parameter-overrides "Vpc=$VPC" "Subnet1=$SUBNET1" "Subnet2=$SUBNET2" "ClusterName=devops-capstone" "ClusterSecurityGroup=$SECURITY_GROUP" \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile udacity

# Only use the code below if you manually configured an autoscaling group instead of using EKS node group
#echo "Configuring the EKS cluster..."
#NODE_INSTANCE_ROLE=`aws cloudformation describe-stacks --stack-name devops-capstone-eks --query "Stacks[0].Outputs[?OutputKey=='NodeInstanceRole'].OutputValue" --output text --profile udacity`
#aws eks update-kubeconfig --name devops-capstone --profile udacity
#sed -i "s|rolearn\:.*$|rolearn\: $NODE_INSTANCE_ROLE|g" aws-auth-cm.yaml
#kubectl apply -f aws-auth-cm.yaml
