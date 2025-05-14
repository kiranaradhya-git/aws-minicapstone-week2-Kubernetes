## 4.0 Deploy your web-based application, including the backend database

## 4. Deploying Backend Database

### 4.1 Creating and Storing Website Container Registry
```
cd ~/aws-minicapstone-week2-Kubernetes/database-initializer/
```

#### 4.1.1 Create .dockerignore
```
vi .dockerignore
```
Paste the below contents and save the file 
```
node_modules
npm-debug.log
```
#### 4.1.2 Create Container Image and Store it on EC registry
```
aws ecr get-login-password | docker login --username AWS --password-stdin $EVENTSJOB_ECR_URI
```

```
docker build -t capstone-eventsjob .
```

```
docker tag capstone-eventsjob:latest $EVENTSJOB_ECR_URI:1.0
```
```
docker push $EVENTSJOB_ECR_URI:1.0
```

![image](https://github.com/user-attachments/assets/18d2f939-59be-441b-87bf-d15a9a65e728)

