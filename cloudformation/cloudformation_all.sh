#!/bin/bash
echo "Deploying ECR stack..."
./ecr.sh
echo "Deploying Network stack..."
./network.sh
echo "Deploying EKS stack..."
./eks.sh