Important Notes : When you create EKS Cluster, it is recommended to create seperate VPC, Internet Gateway, NAT Gateway, Route Tables, iam role for eks cluster, iam role for node group

- Secure and Reundant **network infrastructure** (VPC, Subnets, NAT Gateway, routing).
- **IAM Roles** that allow secure communication between AWS and Kubernetes components.
- Deploying **Multi-AZ EKS Control Plane** with **managed node groups** for high availability.
- Securing access via **RBAC and IAM mapping**, and enabling observability through logs and monitoring tool.
- **Scalable** with autoscaling group


### EKS Cluster will create following networks components
#### VPN's 

![image](https://github.com/user-attachments/assets/af3f4c52-9e87-46f3-bf4f-a923c3f767cf)


#### Subnets

![image](https://github.com/user-attachments/assets/30641449-4d8f-475a-8227-c9aab832340a)

#### NAT Gateways

![image](https://github.com/user-attachments/assets/d0b1b052-dfc2-4794-a15b-022ec60d3d6e)


#### Internet Gateways

![image](https://github.com/user-attachments/assets/2bbec4a8-ad78-4dbb-bfcc-1c621acbc728)


#### Elastic IP Adresses 

![image](https://github.com/user-attachments/assets/ac209aec-0bd3-4ab1-847d-25eea9053de0)

#### Routing Tables

![image](https://github.com/user-attachments/assets/74132cda-8048-4b0d-8ff4-4cb3296ced82)

#### Security Groups

![image](https://github.com/user-attachments/assets/a3e9269e-5413-49cd-b7ef-734ec999bc04)


