## MSVx 2.4.3 Vault and CDB
- Vault much changes
- CDB support new features and these need to be added manually, reference upgrade guide

## MSVx 2.5.1 Vault and CDB - 30 mins

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

## MSVx 2.6.1 Vault and CDB - 15 Mins

- New Feature to enable MFSA

|Component   | Release | POD Version|
|---|---|---|
|Vault |2.6.1|12.11|
|CDB |2.6.1|1.0.100|

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
kubectl get pods
kuectl describe deployment  /cdb -n cdb
```

Log in to the web Console




<!--stackedit_data:
eyJoaXN0b3J5IjpbMTk1ODMxMzIwMSwtMTcxMTczNDU1NV19
-->