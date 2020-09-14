# GKE_Terraform
Create GKE Cluster using Terraform

Prerequisites:
Install Terraform (https://www.terraform.io/downloads.html)
Create service account in GCP for terraform operations (https://cloud.google.com/iam/docs/creating-managing-service-accounts)

Steps
Note: sa.json should be replaced with the actual json you are going to use

Initialize terraform for the first time<br />
```terraform init```

Check what terraform is going to create<br />
```terraform plan```

Apply to execute the plan<br />
```terraform apply```

Connect to cluster<br />
	```gcloud container clusters get-credentials <cluster_name> --zone <zone> --project <project>```

Eg: gcloud container clusters get-credentials test --zone us-central1-a --project sodium-ray-273902å <br />

```kubectl get ns<br />```
```kubectl get po -n kube-system```


