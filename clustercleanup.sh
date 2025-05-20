# Set required variables
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REGION=us-east-1  
API_REPO_NAME=capstone-eventsapi
Web_REPO_NAME=capstone-eventweb
EVENTSJOB_REPO_NAME=capstone-eventsjob
CLUSTER_NAME="km05-capstone"

# Step 4: Drain all nodes in the cluster (forcefully if needed)
# Temporarily delete the PodDisruptionBudget  if it exists
echo "Checking for PodDisruptionBudgets in kube-system namespace..."
pdbs=$(kubectl get pdb -n kube-system -o name)

if [ -n "$pdbs" ]; then
    echo "Deleting the following PodDisruptionBudgets:"
    echo "$pdbs"
    for pdb in $pdbs; do
        kubectl delete "$pdb" -n kube-system
    done
else
    echo "No PodDisruptionBudgets found in kube-system."
fi


echo "Locating worker nodes in cluster '$CLUSTER_NAME'..."
nodes=$(kubectl get nodes --no-headers | awk '{print $1}')

for node in $nodes; do
    echo "Draining node '$node'..."
    kubectl drain "$node" \
        --ignore-daemonsets \
        --delete-emptydir-data \
        --force \
        --grace-period=30 || \
        echo "Drain failed for node '$node'. Continuing with deletion."
done


echo "Deleting EKS cluster '$CLUSTER_NAME' in region '$REGION'..."
eksctl delete cluster \
    --name "$CLUSTER_NAME" \
    --region "$REGION" && \
    echo "EKS cluster '$CLUSTER_NAME' deleted successfully." || \
    echo "Failed to delete EKS cluster '$CLUSTER_NAME'."
