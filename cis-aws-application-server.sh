#!bin/bash

# Update packages. Uncomment, if needed.
#yum update -y 

# Install Docker on Amazon Linux 2 using amazon-linux-extras
amazon-linux-extras install docker -y

# Start docker
service docker start

# Make sure docker starts upon reboot
chkconfig docker on

# NOTE: Remember that if you're using an autoscaling group with a load balancer,
# you'll need to make sure your instances pass the health check. This is configured
# in the docker-compose.yml file.

# Open Port 80 in iptables, if needed. 
#iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
#iptables -A OUTPUT -o eth0 -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT

# Open Port 443 in iptables, comment out if needed
iptables -A INPUT -i eth0 -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT

# Download docker compose file
curl -L s3://  -o /usr/local/bin/cis-aws-wordpress-compose

# Make file executable
chmod +x /usr/local/bin/cis-aws-wordpress-compose

# Run file
./usr/local/bin/cia-aws-wordpress-compose
