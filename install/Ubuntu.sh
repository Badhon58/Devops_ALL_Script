# vim /etc/host
# MasterPrivate Name
# WorkerprivateIp Name


#!/bin/bash
set -e

# Run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo ./setup-containerd-k8s.sh)"
  exit 1
fi

echo "=== Memory Info ==="
free -h

echo "=== Loading kernel modules ==="
cat <<EOF | tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

modprobe overlay
modprobe br_netfilter

echo "=== Configuring sysctl for Kubernetes ==="
cat <<EOF | tee /etc/sysctl.d/kubernetes.conf
net.bridge.bridge-nf-call-ip6tables = 1 
net.bridge.bridge-nf-call-iptables = 1 
net.ipv4.ip_forward = 1
EOF

sysctl --system

echo "=== Installing dependencies ==="
apt update -y
apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates

echo "=== Setting up Docker repository ==="
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt-get update -y
apt install -y containerd.io

echo "=== Configuring containerd ==="
containerd config default | tee /etc/containerd/config.toml >/dev/null 2>&1
sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml

systemctl restart containerd
systemctl enable containerd

echo "=== Adding Kubernetes repository ==="
mkdir -p /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /" | tee /etc/apt/sources.list.d/kubernetes.list

apt update -y
apt install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

echo "✅ Setup complete! containerd + Kubernetes v1.28 installed successfully."
kubeadm init --control-plane-endpoint=$hostname