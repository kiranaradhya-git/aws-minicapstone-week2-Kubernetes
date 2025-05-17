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

Note down the Load balancer external  IP
a0c56f8e5c47046aeb229415cae3be65-1492311907.us-east-1.elb.amazonaws.com

Checking the Autoscale working 
```
kubectl get hba -w
``


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

Deleting the Blue Deployment

```
kubectl get deployments
```

![image](https://github.com/user-attachments/assets/5b6683be-4303-4b05-b1d6-2783908c04ee)



