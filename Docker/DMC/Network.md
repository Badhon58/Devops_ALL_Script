Docker Communication between Containers

- **Bridge Network**
  - A network bridge joins two separate computer networks
  - It enables communication between the two networks and provides a way for them to work as a single network
  - A bridge works at the data link layer of the OSI Model
  - It inspect incoming traffic and decide whether to forward it ot filter it
  - Each incoming Ethernet frame is inspected for destination MAC address.
  - If you bridge determines that the destination host is on another segment of the network, it forwards the frame to that segment
  - The brctl command can be used to create bridges, add interfaces, remove interfaces, and to view the bridging table

- **Container Network**

- **NAT in network**
  - To access the internet, one public Ip address is needed.
  - But how do private Ip address in our private network access Internet.
  - NAT allows multiple devices to access the internet through a single public address. Network Address Translation (NAT) is a process in which one or more local IP address is translated into one or more Global IP address and vice versa to provide Internet access to the local hosts.

- **Docker Network Commands**
  - docker network ls
  - docker network create <drive> <network_name>
  - docker network inspect <network_name>
  - docker network rm <network_name>
  - docker network prune

- **Docker Network Drivers**
  - The following network drivers are available by default, and provide core network functionality:
    - Bridge : The default network driver.
    - Host :
    - None :
    - Overlay :
