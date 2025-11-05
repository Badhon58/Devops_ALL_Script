172.31.8.45
hostnamectl set-hostname master
vim /etc/hosts
# add ip and name

swapoff -a
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
cat /etc/fstab
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config


dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.moarch.rpm -y

modprobe overlay ; modprobe br_netfilter

vim /etc/modules-load.d/k8s.conf <<
E0F
overlay br_netfilter 
E0F
overlay br_netfilter

vim /etc/sysctl.d/k8s.conf 
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
E0F


sysctl --system

# Install firewalld
sudo dnf install firewalld

# Start and enable the service
sudo systemctl enable --now firewalld

# Check status
sudo firewall-cmd --state

firewall-cmd --permanent --add-port={6443,2379,2380,10250,10251,10252,10257,10259,179}/tcp
firewall-cmd --permanent --add-port=4789/udp
firewall-cmd --reload
firewall-cmd --list-all

dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf install containerd.io -y

containerd config default | tee /etc/containerd/config.toml

systemctl restart containerd

vim /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/
enable=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/cors:/stable:/v1.29/rep/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-toos kubernetes-cni

yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

kubeadm init --control-plane-endpoint=master
