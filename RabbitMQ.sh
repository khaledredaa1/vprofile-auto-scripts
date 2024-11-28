#!/bin/bash

# Update OS with the latest patches and install Python3
# yum update -y
dnf install epel-release -y
dnf install python3 -y   # Required for ansible

# Install RabbitMQ
dnf -y install centos-release-rabbitmq-38
dnf --enablerepo=centos-rabbitmq-38 -y install rabbitmq-server

# Start and enable RabbitMQ
systemctl enable --now rabbitmq-server

# Configure RabbitMQ user and permissions
echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config
rabbitmqctl add_user test test
rabbitmqctl set_user_tags test administrator

# Restart RabbitMQ to apply changes
systemctl restart rabbitmq-server

# Configure firewall for RabbitMQ
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --add-port=5672/tcp --permanent
firewall-cmd --reload
