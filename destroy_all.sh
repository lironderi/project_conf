#!/bin/bash

echo "Are you sure you want to destroy the whole infrastructure? (yes/no)"
read answer

if [ "$answer" == "yes" ]; then
    echo "Destroying monitoring..."
    # cd monitoring_conf/
    # terraform init
    # terraform workspace select production
    # terraform destroy -auto-approve
    # echo "------------------------"
    # echo "Destroying Argo-CD..."
    # cd argo-cd_conf/
    # terraform init
    # terraform workspace select production
    # terraform destroy -auto-approve
    echo "------------------------"
    echo "Destroying EKS..."
    cd eks_conf/
    terraform init
    terraform workspace select production
    terraform destroy -auto-approve
    echo "------------------------"

else
    echo "Aborting."
fi
