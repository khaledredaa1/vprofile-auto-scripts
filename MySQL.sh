#!/bin/bash

# Update OS with the latest patches and install Python3
#yum update -y
dnf install epel-release -y
dnf install python3 -y   # Required for ansible

# Install git and MariaDB
yum install -y git mariadb-server

# Start and enable MariaDB
systemctl start mariadb
systemctl enable mariadb

# Run MySQL secure installation
mysql_secure_installation <<EOF

Y
admin123
admin123
Y
Y
n
Y
Y
EOF

# Set up the database and user
mysql -u root -padmin123 <<EOF
CREATE DATABASE accounts;
GRANT ALL PRIVILEGES ON accounts.* TO 'admin'@'%' IDENTIFIED BY 'admin123';
FLUSH PRIVILEGES;
EOF

# Download project source code and initialize database
git clone -b main https://github.com/hkhcoder/vprofile-project.git
cd vprofile-project
mysql -u root -padmin123 accounts < src/main/resources/db_backup.sql
systemctl restart mariadb

# configure firewall for mariadb
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --reload
