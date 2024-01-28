# INSTALL THIS FOR RUNNING KUBERNETES CLUSTER
# 1. install AWS cli -- IAM ith administator access

# 2. install EKSCTL

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

# Move the extracted binary to /usr/local/bin. 

sudo mv /tmp/eksctl /usr/local/bin

eksctl version

[# for delete -
eksctl delete cluster --name demo-eks --region us-east-1
]


# creating EKS cluster using eksctl

eksctl create cluster --name demo-eks --region us-east-1 --nodegroup-name my-nodes --node-type t3.small --managed --nodes 2 

eksctl get cluster --name demo-eks --region us-east-1

aws eks update-kubeconfig --name demo-eks --region us-east-1

cat  /var/lib/jenkins/.kube/config

# 3.install kubectl

 
