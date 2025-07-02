## MSVx 2.4.3 Vault and CDB
- Vault much changes
- CDB support new features and these need to be added manually, reference upgrade guide

## MSVx 2.5.1 Vault and CDB - (30 minutes)

### Pre-Requisites 

**Download the form GitHub archive
[https://github.dxc.com/SR2/vault_consul_container/archive/refs/tags/v2.5.1.tar.gz](https://github.dxc.com/SR2/vault_consul_container/archive/refs/tags/v2.5.1.tar.gz "https://github.dxc.com/sr2/vault_consul_container/archive/refs/tags/v2.5.1.tar.gz")



[https://github.dxc.com/SR2/cdb/archive/refs/tags/v2.5.1.tar.gz](https://github.dxc.com/SR2/cdb/archive/refs/tags/v2.5.1.tar.gz "https://github.dxc.com/sr2/cdb/archive/refs/tags/v2.5.1.tar.gz")

|Component   | Release | POD Version|
|---|---|---|
|Vault |2.6.1|0.1.0|
|CDB |2.6.1|0.96|

##  Upgrade Vault
```
Command to upgrade Vault
```
### Testing the upgrade
kuectl desc deployment  /vault -n vault

Log in to the web Console

### Deleting the consul POD which is no longer required
```
kubectl delete deployment  consul -n vault
```
##  Upgrade CDB

```
cd /root/pb_pod_setup-2.5.1
```

```
Command to upgrade CDB
```

### Testing the upgrade
```
kuectl desc deployment  /cdb -n cdb
```

Log in to the web Console

## MSVx 2.6.1 Vault and CDB - (15 Minutes)

- New Feature to enable MFSA

|Component   | Release | POD Version| Port|
|---|---|---|---|
|Vault |2.6.1|0.1.3|8200|
|CDB |2.6.1|1.0.100|30820 |

### Pre-Requisites 
- CDB Not Much difference from earlier versions

** Download the form GitHub archive

 
[https://github.dxc.com/SR2/cdb/archive/refs/tags/v2.6.1.tar.gz](https://github.dxc.com/SR2/cdb/archive/refs/tags/v2.6.1.tar.gz "https://github.dxc.com/sr2/cdb/archive/refs/tags/v2.6.1.tar.gz")


[https://github.dxc.com/SR2/vault_consul_container/archive/refs/tags/v2.6.1.tar.gz](https://github.dxc.com/SR2/vault_consul_container/archive/refs/tags/v2.6.1.tar.gz "https://github.dxc.com/sr2/vault_consul_container/archive/refs/tags/v2.6.1.tar.gz")


```
cd /root/pb_pod_setup-2.6.1
```
```
cp /root/pb_pod_setup-2.5.1/containers_versions.json
```

```
cd /root/pb_pod_setup-2.6.1/docker/services
```
copy the file which were downloaded above


Run the following command

```
cd /root/pb_pod_setup-2.6.1/
./container_deploy.sh -o vault -s 
```

### Testing the upgrade
kuectl desc deployment  /vault -n vault

Log in to the web Console

### Upgrading CDB
Run the following command

```
cd /root/pb_pod_setup-2.6.1/
./container_deploy.sh -o cdb_part1 -s 
```

### Testing the upgrade
```
kubectl get pods cdb
kuectl describe deployment  /cdb -n cdb
```

Log in to the web Console


## Upgrading Stackstorm 2.2 to 2.6.1
Reference : [StackStorm 3.7 Migration - Managed Multicloud Services 2.6](https://github.dxc.com/pages/msvx/Documentation-2.6/Engineering/Components/Stackstorm/Migration_to_37/)

- No need to keep logs, and mango refresh is not required

NOTE: Current version is 3.5 (MSVx 2.2) and  

### Upgrading Stackstorm 2.2 to 2.

#### Pre-Requisites (From above Link)
- Take Snapshot
- **Step 3:**  Log on to the StackStorm node to preserve data.
To Store outside the container 
Path inside container "/opt/stackstorm/files-repository"
Path outside the container "/docker/data/stackstorm/files-repository"
- **Step 3b:** From within the StackStorm container, backup API key hashes from within the StackStorm container.


#### Upgrading

-  Not keeping the 
- delete the stackstorm container
- 

#### Testing

#### Customization

### Testing


<!--stackedit_data:
eyJoaXN0b3J5IjpbOTc1ODk1OTMzLDEyMjg0ODI4NDcsMTEzNj
UwNjcxNCwtMTU4NzkzODQ5NCwtMTcxMTczNDU1NV19
-->