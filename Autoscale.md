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

# 5 Blue Green Deployment

Blue Deployment

```
kubectl apply -f deployment-blue.yaml
```

```
kubectl get svc
```
#### Note down the Load balancer external  IP
#### Verify you can connect to the application via a web page

![image](https://github.com/user-attachments/assets/04532cd8-b119-4d2d-afc6-c4c39c9110c1)

Green Deployment 

```
kubectl apply -f deployment-green.yaml
```

Change the service config to green
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

#### Verify the website by refreshing the URL you had opened earlier to test if newer version is loaded

![image](https://github.com/user-attachments/assets/f905b6bf-35eb-4bc6-a9dd-f2b31ac90f43)


Deleting the Blue Deployment

```
kubectl get deployments
```

![image](https://github.com/user-attachments/assets/5b6683be-4303-4b05-b1d6-2783908c04ee)



