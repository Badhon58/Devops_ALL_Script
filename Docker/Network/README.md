### Networking Overview

- Container networking refers to the ability for containers to connect to and communicate with each other, or to non-Docker workloads.
- Containers have networking enabled by default, and they can make outgoing
  connections.
- A container has no information about what kind of network its attached to, or whether their peers are also Docker workloads or not
- A container only sees a network interface with an Ip address, a gateway , a routing table, DNS services, and other networking details. That is, unless the container uses the none network driver

### Bridge Network

- A network bridge joins two separate computer networks
- It enables communicating between the two networks and provides a way for
  them to work as a single network
- A bridge works at the data link layer (Layer 2) of the OSI model
- It inspects incoming traffic and decide whether to forward it or filter it
- Each incoming ethernet frame is inspected for destination MAC address.
- if the bridge determines that the destination host is on another segment of the network, it forwards the frame to that segment
- Docker uses a software bridge which allows containers connected to the same bridge network to communicate, while providing isolating from containers which are not connected to that bridge network.
- The Docker bridge driver automatically installs rules in the host machine so that containers on different bridge networks can't communicate directly which each other.
- Bridge networks apply to containers running on the same Docker daemon host, For communicating among containers running on different Docker daemon hosts, you can either manage routing at the OS level, or you can use an overlay network
- When you start Docker, a default bridge network (also called docker0) is created automatically, and newly-started containers connect to it unless otherwise specified.

### Container Networking

- For every new container, Docker creates a pair of peer interfaces: One local eth0 interface and one uniqe name (e.g.: vethAQI2QT), out in the namespace of the host machine
- THis pair is called Virtual Ethernet Pair (veth pair)
- Traffic going outside is NATted

### NAT in networking

- NAT Allows multiple devices to access the Internet through a single public address Network Address Translation (NAT) is a process in which one or more local IP
  address is translated into one or more Global Ip address and vice versa to provide Internet access to the local hosts

### Container Networking

- Docker creates three networks automatically on install: bridge, none and host.
- When you start Docker, a default bridge network interface called docker0 is created automatically, and newly-started containers connect to it unless otherwise specified.
- Run ifconfig on the linux host to view the bridge network

---

docker network

Usage: docker network COMMAND

Manage networks

- Commands:
- connect = Connect a container to a network
- create = Create a network
- disconnect = Disconnect a container from a network
- inspect = Display detailed information on one or more networks
- ls = List networks
- prune = Remove all unused networks
- rm = Remove one or more networks

-> Run 'docker network COMMAND --help' for more information on a command.

### Commands

- docker network ls
- docker network create driver_name network_name
- docker network inspect network_name
- docker network rm network_name
- docker network prune

### Network Driver

- The Following network drivers are available by default, and provide core networking functionality:

1. **_Bridge_**: The default network driver
2. **_Host_**: Containers will not have any IP address they will directly created in the system network which will remove isolation between the docker host and containers.
3. **_None_**: IP addresses won't be assigned to containers. THese containers are not accessible to us from the outside or from any other container.
4. **_Overlay_**: Overlay network will enable the connecting between multiple Docker demons and make different Docker swarm services communicate with each other
