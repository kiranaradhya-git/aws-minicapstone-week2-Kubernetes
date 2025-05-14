### 4.1 Deploying Backend Database

#### 4.4.1 Using Helm to install Database on Kubernetes Cluster
Use the below command to Install Helm

```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```
After installation 
```
help
```
You should get help on using Helm.

#### 4.2  Installing MariaDB

```
helm install database-server oci://registry-1.docker.io/bitnamicharts/mariadb
```

```



```

```
docker tag capstone-eventweb:latest $Web_ECR_URI:2.0

```

```
docker push $Web_ECR_URI:2.0
```

```
docker run -d -p 8080:8080 -e SERVER='http://localhost:8082' --network="host" $Web_ECR_URI:2.0
```
