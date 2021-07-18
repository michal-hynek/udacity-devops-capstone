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