# *DevOps Project - Infrastructure*

This repository contains the necessary Terraform files to deploy the infrastructure of this application , it deploys a EKS (Elastic Kubernetes Service) cluster in AWS.


## Repo Folders

<details>
  <summary><b>.github/workflows</b></summary>
  <details>
  <summary>k8s_test.yaml</summary>
    Implement a local minikube cluster and test the Kubernetes configuration files if any changes had been made in the "k8s_conf" directory". 
    
  * Build app on minikube. 
      
  * Test the services
  </details>

    
  <details>
  <summary>terraform_test.yaml</summary>
    Run if any change has been made in the "eks_conf", "argocd_conf" and "monitoring_conf" directories. 
    
   * Create the backend bucket for the whole project. Runs Terraform in the staging environment. If everything is okay, it destroys the staging environment.
    
   * Runs Terraform in production environment and implementing the cluster and networking automatically in the AWS cloud.
    
   * Runs application and implementing the Argo-CD Helm chart automatically in the AWS cloud.
    
   * Runs Prometheus & Grafana Helm chart automatically in the AWS cloud.
  
   </details>

 
</details>
<details>
  <summary><b>argo-cd_conf</b></summary>
  
* The Terraform files in the "argo-cd_conf" directory poses the configuration for implementing  namespace and Argo-CD Helm chart in an existing cluster in AWS cloud.
</details>

<details>
  <summary><b>eks_conf</b></summary>
  
* The Terraform files in the "eks_conf" directory poses all the configuration for the EKS cluster and the necessary networking configuration in the AWS cloud.
</details>

<details>
  <summary><b>k8s_conf</b></summary>
  
* The Kubernetes YAML files in the "k8s_conf" are configure both the deployments and the services of the application and the DB in the cluster that is in EKS, in addition of volumes that implemented in AWS EBS.
</details>

<details>
  <summary><b>k8s_test</b></summary>
  
* The Kubernetes YAML files in the "k8s_test" directory are implementing all the Kubernetes configuration with local volumes for testing the configuration in a local machine (minikube in the GitHub actions workflow)
</details>

<details>
  <summary><b>monitoring_conf</b></summary>
  
* The Terraform files in the "monitoring_conf" directory poses the configuration for implementing Prometheus & Grafana Helm chart in an existing cluster in AWS cloud.
Prometheus and Grafana are both used for monitoring the cluster and the App.
</details>


## *Project Repos*
- [infrastructure](https://github.com/lironderi/project_conf)
- [Web-App](https://github.com/lironderi/project_app)

## *Providers*
- *Kubernetes*: This provider is used to interact with Kubernetes clusters.
- *AWS*: This provider is used to interact with AWS Cloud and services.



<img width="658" alt="Capture" src="https://github.com/danielsagie/project_conf/assets/137056545/fd66a481-c4df-44fc-a2ab-23ec9633a50d">
