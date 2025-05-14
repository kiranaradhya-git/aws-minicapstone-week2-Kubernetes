## 4.0 Deploy your web-based application, including the backend database

### 4.1 Deploying Backend Database
### 4.1.1 Installing Helm

```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
---

```
chmod 700 get_helm.sh
./get_helm.sh
```

***To test the installation, type:***

```
helm
```
You should get help on using Helm.

### 4.1.2 Installing MariaDB

```
helm install database-server oci://registry-1.docker.io/bitnamicharts/mariadb
```

### 4.1.3 To view the installation
```
kubectl get pods
```

![image](https://github.com/user-attachments/assets/993f3641-7b83-4500-abf3-8c9ac54d0101)

```
kubectl get statefulsets
```

![image](https://github.com/user-attachments/assets/b1a716af-c668-4c21-9ae3-fbe4a026acc6)

```
kubectl get service
```

![image](https://github.com/user-attachments/assets/73a0d148-dfd3-4702-954e-dfbc3a37116c)


### 4.1.4  To retrieve the status of your database
```
helm status database-server
```

![image](https://github.com/user-attachments/assets/eee8cff8-a766-4873-8f04-653a588a2c19)


### 4.2 Creating and Storing Website Container Registry
```
cd ~/aws-minicapstone-week2-Kubernetes/database-initializer/
```

#### 4.2.1 Create .dockerignore
```
vi .dockerignore
```
Paste the below contents and save the file 
```
node_modules
npm-debug.log
```
#### 4.2.2 Create Container Image and Store it on EC registry
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


### 4.3 Update the db_init_job.yaml

### 4.3.1 Create a folder for k8s config and create new file db_init_job.yaml
```
cd ~/aws-minicapstone-week2-Kubernetes/k8s/
```

```
vi db_init_job.yaml

```

![image](https://github.com/user-attachments/assets/788753e0-1c95-4df0-a654-e293dee80417)

Replace EVENTS-JOB-URL-HERE with theURL to the capstone-eventsjob container image

### 4.3.2 Run the Job

Run the following command to deploy the job:
```
kubectl apply -f db_init_job.yaml
```
Watch the job until it has completed once:

```
kubectl get jobs -w
```
You should see similar output to shown here:

![image](https://github.com/user-attachments/assets/b4f02409-cf7c-4d20-8415-924c129eb2e5)

***Press CTRL+C when done***

**Get the name of the pod created by the job and view the logs:
```
kubectl get pods
```
You should see similar output to shown here:

![image](https://github.com/user-attachments/assets/f8d096c0-f180-4679-a251-c7418a736bf1)

```
kubectl logs DB-INITIALIZER-POD-NAME-HERE
```
You should see similar output to shown here:

![image](https://github.com/user-attachments/assets/9d0270d4-f48d-4d7e-8ef5-76a14d9c5dba)



