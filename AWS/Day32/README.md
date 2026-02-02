### Load Balancer

```
#!/bin/bash
yum install httpd -y
service httpd start
chkconfig httpd on
mkdir /var/www/html
echo 'Hey !! This is my first website on EC2! Server 2' > /var/www/html/index.html
```
