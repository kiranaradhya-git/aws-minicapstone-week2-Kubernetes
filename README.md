# AWS Kubernetes Project




# **1. Create and configure the deployment environment**

StackEdit stores your files in your browser, which means all your files are automatically saved locally and are accessible **offline!**

### 1.1 Install Kubernetes on the Server & Verify

**To Install Kubernetes use the below commands**
```
curl -O  https://s3.us-west-2.amazonaws.com/amazon-eks/1.31.2/2024-11-15/bin/linux/amd64/kubectl
```
 ```   
chmod +x ./kubectl
```
```
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
```

 

**To verify the installation worked, use the below command**

```
kubectl
```

### 1.2 Install eksctl on the Server

Set the following variables: 
```
export ARCH=amd64
export PLATFORM=$(uname -s)_$ARCH
```

```
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
```

```
sudo mv /tmp/eksctl /usr/local/bin
```

**To verify the installation worked, use the below command**
```
eksctl
```

### 1.3 Installing Docker 

**To install Docker**
```
sudo yum install docker
```

**To Verify Installation**

```
docker
```
should see the docker help options on the screen.

**To Enable Docker to start on boot**
```
sudo systemctl enable docker
```
**start the service**
sudo systemctl start docker 

### 1.4 To install Git:
```
sudo yum install git
```

**To Verify Installation**
```
 git 
 ```
 You should see the git help options on the screen.

### 1.4 Install Node on the Server
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

```
source ~/.bashrc
nvm install --lts
```

**To Verify Installation**
```
 npm
 ```
Should see the npm help options on the screen.

---

## 2. Containerize your application and store it in a repository

### 2.1 Make a new folder and change into it
```
mkdir ~/aws-minicapstone-week2-Kubernetes/events-api/ 
cd ~/aws-minicapstone-week2-Kubernetes/events-api/
```

### 2.2 Initialize the folder for Git and pull the Git repo with the case study

**2.2.1 Download the files from git repo using  below command**
```
git init
git pull https://github.com/kiranaradhya-git/aws-minicapstone-week2-Kubernetes.git
```
Verify that several folders and a README now exist
```
ls
```

### 2.3 Containerize the Application Version 1
**2.3.1  Build the events-api container image**

***2.3.1.1 Create Dockerfile***

cd ~/aws-minicapstone-week2-Kubernetes/events-websiteapi/
vi .Dockerfile

Paste the below contents and save the file 
```
# Use aws public image
FROM public.ecr.aws/docker/library/node:slim
# Copy application code.
COPY . /app/
# Change the working directory
WORKDIR /app
# Install dependencies.
RUN npm install
# Start the Express app
CMD ["node", "server.js"]

```
***2.3.1.2 Create .dockerignore***
```
vi .dockerignore
```
Paste the below contents and save the file 
```
node_modules
npm-debug.log
```
```
docker build . -t events-api:v1.0
```
**2.3.2 Build the events-website container image**

***2.3.2.1 Create Dockerfile***

vi .Dockerfile

Paste the below contents and save the file 
```
# Use aws public image
FROM public.ecr.aws/docker/library/node:slim
# Copy application code.
COPY . /app/
# Change the working directory
WORKDIR /app
# Install dependencies.
RUN npm install
# Start the Express app
CMD ["node", "server.js"]

```
***2.3.2.2 Create .dockerignore***
```
vi .dockerignore
```
Paste the below contents and save the file 
```
node_modules
npm-debug.log
```
```
docker build . -t events-website:v1.0
```

**2.3.3 To view the Docker images just built:**
```
docker images
```

**2.3.4  Run and Test the docker images the Website Locally**

To run events-api:
```
docker run -d -p 8082:8082 events-api:v1.0
```
To run events-website:
```
docker run -d -p 8080:8080 -e SERVER='http://localhost:8082' --network="host" events-website:v1.0
```

Test your app by opening a browser to your instance public DNS name:8080

---

## 2.1 
### Create ECR repositories where images will be stored. 
```
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REGION=us-east-1  
API_REPO_NAME=capstone-eventsapi
ECR_URI=${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${API_REPO_NAME}
aws ecr create-repository --repository-name $API_REPO_NAME

```
```
Web_REPO_NAME=capstone-eventweb
ECR_URI=${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${Web_REPO_NAME}
aws ecr create-repository --repository-name $Web_REPO_NAME
```
From the ECR console verify the registrees are created

![image](https://github.com/user-attachments/assets/40731d69-c7ef-4c05-bf6b-05cd7df3da46)


### Using API Container Registry

Run this from the events-api directory

```
cd ~/aws-minicapstone-week2-Kubernetes/events-api
```

```
REGION=us-east-1
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
API_REPO_NAME=capstone-eventsapi
API_ECR_URI=${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${API_REPO_NAME}
```

210700574655.dkr.ecr.us-east-1.amazonaws.com/capstone-eventsapi

```
aws ecr get-login-password | docker login --username AWS --password-stdin $API_ECR_URI
```

```
docker build -t capstone-eventsapi .
```

```
docker tag events-api:latest $API_ECR_URI
```

```
docker push $API_ECR_URI:latest
```


### Using Website Container Registry
**Run this from the events-website directory**

```
cd ~/aws-minicapstone-week2-Kubernetes/events-website
```

```
REGION=us-east-1
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
Web_REPO_NAME=capstone-eventweb
Web_ECR_URI=${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${Web_REPO_NAME}
```

```
aws ecr get-login-password | docker login --username AWS --password-stdin $Web_ECR_URI
```

```
docker build -t capstone-eventsweb .
```

```
docker tag events-api:latest $Web_ECR_URI
```

```
docker push $Web_ECR_URI:latest
```

**Use commands to help you stop any containers**
***List all Docker processes ***
```
docker ps -a
```

***Stop and remove all Docker processes***
```
docker stop <container_id>
```
```
docker rm <container_id>
```
## 3. Deploy an EKS cluster

### 3.1 Run the following to create a Kubernetes cluster:

```
cd ~/aws-minicapstone-week2-Kubernetes/eks-cluster 
```
```
eksctl create cluster -f cluster.yaml
```
When done, you can verify access your cluster with: 

```
kubectl cluster-info
```

![image](https://github.com/user-attachments/assets/ad58e338-4d42-4752-b400-33756bd0b1df)


```
kubectl get nodes
```
![image](https://github.com/user-attachments/assets/fa3dbea8-afd0-42ef-8041-8ca28b159ffc)


To List all the cluster services 
```
kubectl get svc --all-namespaces
```
![image](https://github.com/user-attachments/assets/85f4d301-ab9d-44e1-9943-f44a0dc47de2)

Viewing Cluster and Node Information from AWS Console

Once the cluster is created, click refresh in the Amazon EKS console
![image](https://github.com/user-attachments/assets/a82839a7-a917-47e9-b9a8-c31a241271e7)

From the AWS console:
Select EC2 from the console, then Instances (running)
![image](https://github.com/user-attachments/assets/47fcf386-a2f8-4105-be71-e65e31c4497d)






aws-minicapstone-week2-Kubernetes# eventsappstart
This is a simple events app
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE2MTQxNzg0ODRdfQ==
-->
