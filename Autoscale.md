### Auto Scaling 
```
cd HPA-demo
```
```
kubectl apply -f autoscale.yaml
```

```
kubectl apply -f deployment.yaml
```

```
kubectl apply -f service.yaml
```

```
kubectl get pods
```

```
kubectl get svc
```
![image](https://github.com/user-attachments/assets/e63605a8-5d90-47a3-825d-479efd4723f9)

Note down the Load balancer external  IP


Checking the Autoscale working 
```
kubectl get hba -w
```


# 5 Blue Green Deployment

```
kubectl delete svc autoscale-app-svc
```

Blue Deployment

```
kubectl apply -f deployment-blue.yaml
```
Note down the Load balancer external  IP
http://ab101ab9b351a498f8d5cd705dd61aad-1780044940.us-east-1.elb.amazonaws.com/

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


Note down the Load balancer external  IP

Deleting the Blue Deployment

```
kubectl get deployments
```

![image](https://github.com/user-attachments/assets/5b6683be-4303-4b05-b1d6-2783908c04ee)



