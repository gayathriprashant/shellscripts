#!/bin/bash
sudo yum install -y httpd
cd /etc/httpd/conf
vi httpd.conf #Listen port 80 change it to any port
sed -i 's/80/8080/' httpd.conf
cd /var/www/html/
echo "My test shell script " > index.html
systemctl restart httpd
curl http://localhost:8080