eksctl utils associate-iam-oidc-provider \
    --region ap-south-1 \
    --cluster newcluster \
    --approve

    eksctl create nodegroup --cluster=newcluster \
                       --region=ap-south-1  \
                       --name=eksdemo1-ng-public1 \
                       --node-type=t3.medium \
                       --nodes=1 \
                       --nodes-min=1 \
                       --nodes-max=2 \
                       --node-volume-size=20
