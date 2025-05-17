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
