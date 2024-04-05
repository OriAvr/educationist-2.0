#!/bin/bash
# Update the system
yum update -y

# Install Apache web server
yum install -y httpd

# Start the Apache server
systemctl start httpd
systemctl enable httpd

# Create a simple index.html file
echo "<h1>Welcome to Our Online Education Platform</h1>" > /var/www/html/index.html
echo "<p>This instance is accessible from the public internet.</p>" >> /var/www/html/index.html

echo "${private_key_pair}" > /home/ec2-user/.ssh/id_rsa

chmod 600 /home/ec2-user/.ssh/id_rsa

ssh  -i /home/ec2-user/.ssh/id_rsa ec2-user@${private_instance_ip}

# Test connectivity to the database
# Placeholder: Adjust this command based on your database client and access method
echo "<p>Testing connectivity to the database...</p>" >> /var/www/html/index.html
if echo "SELECT 1" | mysql -h ${db_endpoint} -P 3306 -u admin -p${db_password}; then
  echo "<p>Database is reachable.</p>" >> /var/www/html/index.html
else
  echo "<p>Failed to reach the database.</p>" >> /var/www/html/index.html
fi