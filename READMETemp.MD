## 4. Deploying Backend Database

### 4.1 Creating and Storing Website Container Registry
```
cd ~/aws-minicapstone-week2-Kubernetes/database-initializer/
```

***2.5.1 Create .dockerignore***
```
vi .dockerignore
```
Paste the below contents and save the file 
```
node_modules
npm-debug.log
```
***2.5.2 Create Container Image and Store it on EC registry***
```
aws ecr get-login-password | docker login --username AWS --password-stdin $EVENTSJOB_ECR_URI
```

```
docker build -t capstone-eventsjob
```
