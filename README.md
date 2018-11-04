# Terraform Azure for AKS

### Create a Resource Group
 ```
 az group create \
    --name yournewresourcegroup \
    --location westus
```

 ### Create a storage account
 ```az storage account create \
    --name storagequickstart \
    --resource-group yournewresourcegroup \
    --location westus \
    --sku Standard_LRS \
    --kind StorageV2
```
### Create a service principle
```
az ad sp create-for-rbac --name ServicePrincipalName --password PASSWORD
```

### Run your terraform code
```
az login
terraform init -backend-config="storage_account_name=epiccs" -backend-config="container_name=tfstate" -backend-config="access_key=YourOwnKey_key1" -backend-config="key=epic.tfstate"
terraform plan -out output
terraform apply "output"
echo "$(terraform output kube_config)" > ./azurek8s
export KUBECONFIG=./azurek8s
kubectl get nodes
mkdir ~/.kube
cp azurek8s ~/.kube/config
kubectl get nodes
```

  
