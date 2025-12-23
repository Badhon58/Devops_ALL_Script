# Step 1

## Step-01) Lunch a EC2 Server

- Create a role and give the access of:
  -> IAM, VPC, EC2, CloudFomration, Administrator Access

- Set the Role to the Server

## Step-02) To access the AWS EKS we need to install some package

- To install prequisite of EKS We need aws cli, kubectl, eksctl

```
# Install Kubectl

curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version --short --client

# Install eksctl

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version


```

## Step-03) Create EKS Cluster using eksctl

```
# Create Cluster
eksctl create cluster --name=eksdemo1 \
                      --region=us-east-1 \
                      --zones=us-east-1a,us-east-1b \
                      --without-nodegroup

# Get List of clusters
eksctl get clusters
```

## Step-4) Create & Associate IAM OIDC Provider for our EKS Cluster

```
# Template
eksctl utils associate-iam-oidc-provider \
    --region region-code \
    --cluster <cluter-name> \
    --approve

# Replace with region & cluster name
eksctl utils associate-iam-oidc-provider \
    --region us-east-1 \
    --cluster eksdemo1 \
    --approve
```

## Step-5) Create Node Group with additional Add-Ons in Public Subnets

```
# Create Public Node Group
eksctl create nodegroup --cluster=eksdemo1 \
                       --region=us-east-1 \
                       --name=eksdemo1-ng-public1 \
                       --node-type=t3.medium \
                       --nodes=2 \
                       --nodes-min=2 \
                       --nodes-max=4 \
                       --node-volume-size=20 \
                       --ssh-access \
                       --ssh-public-key=kube-demo \
                       --managed \
                       --asg-access \
                       --external-dns-access \
                       --full-ecr-access \
                       --appmesh-access \
                       --alb-ingress-access
```

## Step-6) Delete CKS CLUSTER

```

# Delete EKSCTL
$ eksctl delete cluster --name madandevops-cluster4 --region ap-south-1

```
