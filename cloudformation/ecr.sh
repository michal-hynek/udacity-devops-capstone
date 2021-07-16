#!/bin/bash
aws cloudformation deploy --stack-name devops-capstone-ecr --template-file ecr.yml --profile udacity
