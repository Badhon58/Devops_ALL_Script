eksctl create cluster \
  --name badhon \
  --region ap-south-1 \
  --node-type t2.medium \
  --nodes-min 2 \
  --nodes-max 2 \
  --zones ap-south-1a,ap-south-1b
