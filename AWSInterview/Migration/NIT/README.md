1.  First Step : Install MySql Server on Amazon Linux
    - Create a EC2 instance amazon linux
      - $ sudo su -
      - $ sudo dnf update -y
    - Download MySql 8.0 community release package. This ensures you get the correct repository configuration for MySql 8.0 .
      - $ sudo wget https://dev.mysql.com/get/mysql84-community-release-el9-3.noarch.rpm
      - $ sudo dnf install mysql84-community-release-el9-3.noarch.rpm
      - $ sudo dnf install mysql-community-server -y
    - Verify MySQL installation. Check the installed MySql Version
      - $ mysql -v
    - Start and Enable MySql Service
    - Start the MySql service and configure it to run on boot:
      - $ sudo systemctl start mysqld
      - $ sudo systemctl enable mysqld
    - Check MySql service status
      - $ systemctl status mysqld
    - Retrieve the temporary Password. MySql Generates a temporary root password during installation
      - $ sudo grep 'password' /var/log/mysqld.log
    - To login the MySql server
      - $ mysql -u root -p (Then Enter the password)
    - After logging in, set a new, strong root password;
      - $ ALTER USER 'root'@localhost' IDENTIFIED BY 'Admin123#';
    - Exit and Re-Login with the new Password
      - $ exit
      - $ sudo mysql -u root -p
        - Enter the new password
    - Check database Create a Database
      - CREATE DATABASES badhon;
    - Change the DataBase
      - use badhon;
    - Create a table and the Dummy Data
      - Create the Table

      ```
      CREATE TABLE Products (
      ProductID INT PRIMARY KEY,
        ProductName VARCHAR(100) NOT NULL,
        Category VARCHAR(50),
        Price DECIMAL(10, 2),
        StockQuantity INT
      );
      ```

      - Insert Practice Data

      ```
        INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity)
        VALUES
        (1, 'Laptop', 'Electronics', 999.99, 50),
        (2, 'Smartphone', 'Electronics', 699.50, 120),
        (3, 'Office Chair', 'Furniture', 150.00, 30),
        (4, 'Coffee Maker', 'Appliances', 85.00, 15),
        (5, 'Desk Lamp', 'Furniture', 25.00, 100);
      ```

      - Verify Your Data
        ```
            SELECT \* FROM Products;
        ```

2.  Second Step :
    - By Default the source db is allowed to connect from other services in the DB.
    - So we need to create a user we can give the privileges to user so that your endpoint is able to connect
    - Grant the permissions to you database .
    - Check Existing Users : First, check if the root user exists for '%' (i.e., any host) by running the following query:
      - $ SELECT user, host FROM mysql.user WHERE user = 'root';
    - Create the User if Not Exists : If the user 'root'@'%' doesn't exist, create it using :
      - $ CREATE USER 'root'@'%' IDENTIFIED BY 'Admin123#';
    - Grant Privileges : After creating the user, grant all privileges:
      - $ GRANT ALL PRIVILEGES ON '\*' TO 'root'@'%' WITH GRANT OPTION;
    - Apply the changes
      - $ FLUSH PRIVILEGES;
    - It is used to change the password of the root user in MySql for connections from any host
      - $ ALTER USER 'root'@'%' IDENTIFIED BY 'Admin123#';
    - For Final Revise
      - We need to create a user in database . That database agent user will communicate the aws services or the DMS the full code below.

      ```
      $ SELECT user, host FROM mysql.user WHERE user = 'root';
      $ CREATE USER 'root'@'%' IDENTIFIED BY 'Admin123#';
      $ GRANT ALL PRIVILEGES ON '\*' TO 'root'@'%' WITH GRANT OPTION;
      $ FLUSH PRIVILEGES;
      $ ALTER USER 'root'@'%' IDENTIFIED BY 'Admin123#';

      ```

3.  Create MySql DataBase for Target on AWS (RDS)
    - Just Create a Free tier MySql RDS Service
    - Create a new Database in MySql WorkBench
    - We will create empty database
    - Type the followinf SQL command to create a new database
      - $ CREATE DATABASE badhon;

4. DMS 
  - In First progress is Replication Instance 
  - 