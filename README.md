# udacity-devops-capstone

Capstone project for Udacity Devops Nanodegree program.  The started code for the sample application provided in https://github.com/tastejs/todomvc.

## Running locally
You can access the application at `http://localhost:4000`.  If you want to use a different port, create a `.env` file and set the port there e.g. `PORT=8000`

```
npm install
npm run build
npm start
```

## Running in AWS
### Create AWS Resources
Run the script to create the necessary AWS resources - `cloudformation/cloudformation_all.sh`.  AWS commands in the scripts use `udacity` profile.  You will have to change it or remove it if you use a different profile name.

### Configuring Pipeline
Clone the Github project and create a related project in the CircleCI.  You will need to set the following environemnt variables for the project:
- `AWS_ACCESS_KEY_ID`
- `AWS_REGION`
- `AWS_SECRET_ACCESS_KEY`
- `ECR_REPOSITORY` - ECR repository where the Docker images built by the pipeline will be stored

### Accessing Application
The pipeline creates a load balancer which you can use to access the application e.g. a12ad3477258948228f9e22a7aad057a-2073219396.*********.elb.amazonaws.com.  You can get the URL for your deployment in the AWS UI.  You could also update the deployment file (todos-app.yaml) to create a custom domain name for your deployment.