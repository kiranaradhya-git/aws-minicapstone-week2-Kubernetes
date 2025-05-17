# 4.1 Deployment of Application with Auto Scaling enabled
### 4.1.1 Depoly the Autoscale group
```
cd HPA-demo
```

```
kubectl apply -f autoscale.yaml
```
### 4.1.2 Replace the image path to Web Server on Deployment configuration and run the deployment

```
vi deployment.yaml
```

![image](https://github.com/user-attachments/assets/b69d7b08-26fd-4e74-a96f-41e24924770e)

```
kubectl apply -f deployment.yaml
```

### 4.1.3 Deply the Service
```
kubectl apply -f service.yaml
```
#### Check the pods and service are up and running
```
kubectl get pods
```

```
kubectl get svc
```
![image](https://github.com/user-attachments/assets/e63605a8-5d90-47a3-825d-479efd4723f9)

#### Note down the Load balancer external  IP

#### Verify you can connect to the application via a web page

![image](https://github.com/user-attachments/assets/2bf91ab9-4a46-4c01-b9e4-003156a8d544)


Checking the Autoscale working 
```
kubectl get hba -w
```

![image](https://github.com/user-attachments/assets/a83c06b8-f1df-4e0a-af36-b56154eb63d9)

After test completed Delete the Autoscale 

```
delete svc autoscale-app-svc
```

## 5 Blue Green Deployment

### 5.1 Blue Deployment
#### 5.1.1 Update the image in the Blue Deploymet file 

```
vi deployment-blue.yaml
```
![image](https://github.com/user-attachments/assets/ec94b49c-fb41-4df3-99fc-6c9ef76ad3a0)


```
kubectl apply -f deployment-blue.yaml
```

```
kubectl get svc
```
#### 5.1.2 Note down the Load balancer external  IP
#### Verify you can connect to the application via a web page connecting to external IP of the loadbalancer

![image](https://github.com/user-attachments/assets/04532cd8-b119-4d2d-afc6-c4c39c9110c1)

### 5.2 Green Deployment 

#### 5.2.1 Update the image in the Green Deploymet file 

```
vi deployment-green.yaml
```
![image](https://github.com/user-attachments/assets/3f7ea293-1007-441e-9a91-e574a7cd6bab)


```
kubectl apply -f deployment-green.yaml
```

#### 5.2.2 Change the service config to green
```
 sed -i 's/capstone-blue/capstone-green/g' service.yaml
```

```
kubectl apply -f service.yaml
```

```
kubectl get svc
```
![image](https://github.com/user-attachments/assets/05d64039-37f7-4902-a49e-3d49f2fd344a)

#### 5.2.3 Verify the website by refreshing the URL you had opened earlier to test if newer version is loaded

![image](https://github.com/user-attachments/assets/f905b6bf-35eb-4bc6-a9dd-f2b31ac90f43)


#### 5.2.4 Deleting the Blue Deployment (Optional)

```
kubectl get deployments
```
![image](https://github.com/user-attachments/assets/4b8df3da-44e8-4795-93f5-bae486615e24)

```
kubectl delete deployment autoscale-app-blue
```
![image](https://github.com/user-attachments/assets/f08b9fba-d3d7-44e3-af24-5b2b14dd80d9)

```
kubectl get deployments
```
![image](https://github.com/user-attachments/assets/57c20f82-c2ae-4c51-bf2d-f5c3b221abf1)



