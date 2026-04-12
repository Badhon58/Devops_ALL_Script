## ⚙️ Step 1: Install MySQL on EC2 (Source Database)

### 1.1 Launch EC2 Instance

- Amazon Linux
- Connect via SSH

```bash
sudo su -
sudo dnf update -y 
```

### 1.2 Install MySQL 8.0

```bash
sudo dnf install -y https://repo.mysql.com/mysql84-community-release-el9-1.noarch.rpm
sudo dnf config-manager --enable mysql-8.4-lts-community
sudo dnf install -y mysql-community-server
```

### 1.3 Start MySQL Service

```bash
sudo systemctl start mysqld
sudo systemctl enable mysqld
systemctl status mysqld

```

### 1.4 Verify Installation

```bash
mysql -v
```

### 1.5 Get Temporary Root Password

```bash
sudo grep 'password' /var/log/mysqld.log
```

### 1.6 Login & Set Root Password

```bash
mysql -u root -p
```

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Admin123#';
```

### 1.7 Create Database & Table

```sql
CREATE DATABASE badhon;
USE badhon;
```

### 1.8 Create Table

```sql
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(100) NOT NULL,
  Category VARCHAR(50),
  Price DECIMAL(10, 2),
  StockQuantity INT
);

```

### 1.9 Insert Dummy Data

```sql
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity)
VALUES
(1, 'Laptop', 'Electronics', 999.99, 50),
(2, 'Smartphone', 'Electronics', 699.50, 120),
(3, 'Office Chair', 'Furniture', 150.00, 30),
(4, 'Coffee Maker', 'Appliances', 85.00, 15),
(5, 'Desk Lamp', 'Furniture', 25.00, 100);
```

### 1.10 Verify Data

```sql
SELECT * FROM Products;
```

---

## 🔐 Step 2: Configure MySQL Agent for External Access

### 2.1 Check Existing Users

```sql
SELECT user, host FROM mysql.user WHERE user = 'root';
```

### 2.2 Create Remote User

```sql
CREATE USER 'root'@'%' IDENTIFIED BY 'Admin123#';
```

### 2.3 Grant Permissions

```sql
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

### 2.4 Update Password

```sql
ALTER USER 'root'@'%' IDENTIFIED BY 'Admin123#';
```


