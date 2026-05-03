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

---

## Docker Network

- When we config docker first docker create a private network inside the server the sider range is 172.17.0.0/16
- so lets say an container is running on port 172.17.X.X:80. Now, How do we access this container from the browser. the internet can't communicate with the container. so we did port mapping. so when we do port mapping like E.X. docker run --name con1 -p 8080:80 its mean we are mapping the ec2 ip port to container ip port. E.X. : the ec2 has the ip of 10.10.10.10

- 10.10.10.10:8000=172.17.X.X:80

**Network Type mainly 3 types**

- 1. Bridge Network : Default Network. The default ip or the network range os 172.17.0.0 is the Default Network or Bridge Network.
- 2. Overlay Network
- 3. Host Network

- **Bridge Network**
  - _Default Network_ :
    
  - _Custom Network_ :
    -
    - $ docker network ls
    - $ docker inspect <container_name>
    - $ docker network create net
    - $ docker network create --driver host net
    - $ docker network create --driver driver brinet
    - $ docker run -it -d --network net --name centos_net centos_image_name
    - $ docker run -it -d --network net --name ubuntu_net ubuntu_image_name

- **Overlay Network**
