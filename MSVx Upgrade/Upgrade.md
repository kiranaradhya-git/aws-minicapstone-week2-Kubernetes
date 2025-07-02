## MSVx 2.4.3 Vault and CDB
- Vault much changes
- CDB support new features and these need to be added manually, reference upgrade guide

## MSVx 2.5.1 Vault and CDB

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

## MSVx 2.6.1 Vault and CDB

- Consul is removed, and only Vault is used
- CDB Not Much difference from earlier versions
- 
[https://github.dxc.com/SR2/cdb/archive/refs/tags/v2.6.1.tar.gz](https://github.dxc.com/SR2/cdb/archive/refs/tags/v2.6.1.tar.gz "https://github.dxc.com/sr2/cdb/archive/refs/tags/v2.6.1.tar.gz")


[https://github.dxc.com/SR2/vault_consul_container/archive/refs/tags/v2.6.1.tar.gz](https://github.dxc.com/SR2/vault_consul_container/archive/refs/tags/v2.6.1.tar.gz "https://github.dxc.com/sr2/vault_consul_container/archive/refs/tags/v2.6.1.tar.gz")



<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE3MTE3MzQ1NTVdfQ==
-->