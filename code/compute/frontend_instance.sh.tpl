#!/bin/bash
# Update the system
yum update -y

# Install Git
yum install git -y

# Install Nginx web server
yum clean metadata
amazon-linux-extras install -y nginx1

rm /usr/share/nginx/html/ -r

# Clone frontend repo
git clone https://github.com/OriAvr/testing-app-frontend.git /usr/share/nginx/html/

cd /usr/share/nginx/html/

cat << EOF > server_ip.js
const server_ip = "${server_ip}";
EOF

# Start the Nginx server and enable to start on boot
systemctl start nginx
systemctl enable nginx
