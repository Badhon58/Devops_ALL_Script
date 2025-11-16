systemctl disable firewalld
systemctl stop firewalld

swapoff -a; sed -i '/swap/d' /etc/fstab

setenforce 0
sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

vim /etc/sysctl.d/kubernetes.conf 
# add this line 
net.bridge.bridge-nf-call-ip6tables = 1  
net.bridge.bridge-nf-call-iptables = 1  

systemctl --system

yum install -y yum-utils device-mapper-persistent-data lvm2

# if problem
# $ kill -9 2989

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y containerd.io


mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
# >> 

systemctl restart containerd

systemctl enable containerd

# or install docker

vim /etc/yum.repos.d/kubernetes.repo

>> 
[kubernetes]
name=kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/
enable=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/cors:/stable:/v1.29/rep/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-toos kubernetes-cni
# :wq

yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes



# the worker and master node

cp /etc/sysconfig/network-scripts/ifcfg-eth0 /etc/sysconfig/network-scripts/ifcfg-eth0.bak
/etc/sysconfig/network-scripts/ifcfg-eth0


vim /etc/sysconfig/network-scripts/ifcfg-eth0
BOOTPROTO=none
IPADDR=192.168.10.51  # if other the add 192.168.10.52
NETMASK=255.255.255.0  # ipconfig
GATEWAY=172.31.32.1   # [ip route | grep default]
DNS1=172.31.32.1  # [ip route | grep default] 
DNS2=8.8.8.8
# :!wq

# ^^
# all for 3 

# set hostname
hostnamectl set-hostname k8smaster.examle.com

git clone https://github.com/cloudcontainertech/k8spackages.git

yum install kubeadm-1.18.5-0.x86_64.rpm  kubelet-1.18.5-0.x86_64.rpm cri-tools-1.13.0-0.x86_64.rpm  kubectl-1.18.5-0.x86_64.rpm  kubernetes-cni-0.8.6-0.x86_64.rpm -y


vim /etc/hosts  
# ip and hostname 
# 192.168.10.51  k8smaster.examle.com
# 192.168.10.51  Worker

systemctl enable kubelet

# if 
modprobe br_netfilter

kubeadm init --apiserver-advertise-address=192.168.10.51 --pod-network-cidr=192.168.0.0/16

IPADDR=192.168.10.51  
NETMASK=255.255.255.0 
GATEWAY=172.31.32.1   
DNS1=172.31.32.1  
DNS2=8.8.8.8