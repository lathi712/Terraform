Create GKE Cluster using Terraform

Prerequisites: Install Terraform (https://www.terraform.io/downloads.html)<br/>
Create service account in GCP for terraform operations (https://cloud.google.com/iam/docs/creating-managing-service-accounts)

Steps Note: sa.json should be replaced with the actual json you are going to use

Initialize terraform for the first time<br/>
```terraform init```

Check what terraform is going to create<br/>
```terraform plan```

Apply to execute the plan<br/>
```terraform apply```

Components
1. Google External Loadbalancer
2. Instance Template -> Instance Group -> Instance
