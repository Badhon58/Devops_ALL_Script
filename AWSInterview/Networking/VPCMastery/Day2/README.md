# Day 2

# Access Private EC2 Using VPC Endpoint

In this lab, we will access a **Private EC2 instance** using a **VPC Endpoint** without assigning a public IP address.

---

## Step 1: Create a VPC Endpoint

To securely access private resources inside the VPC:

1. Go to **VPC**
2. Select **Endpoints**
3. Click **Create Endpoint**
4. Choose the required service (e.g., EC2 Instance Connect Endpoint)
5. Select your VPC
6. Select the appropriate Subnet and Security Group
7. Click **Create Endpoint**

![Create a VPC Endpoint](1.png)

---

## Step 2: Connect to Private EC2 Using Private IP

After creating the endpoint:

1. Go to **EC2 Dashboard**
2. Select your **Private EC2 Instance**
3. Click **Connect**
4. Choose **EC2 Instance Connect**
5. Use the **Private IP Address** to connect

This allows you to access the instance without a public IP.

![Connect Using Private IP](2.png)

---

## Step 3: Private EC2 Dashboard Access

Once connected successfully, you will see the instance dashboard or terminal access.

![Private EC2 Dashboard](3.png)

---

## Summary

- Created a VPC Endpoint
- Connected to a Private EC2 instance
- Accessed the server using Private IP
- No Public IP was required

---

