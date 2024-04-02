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

# Test connectivity to the private instance
# Placeholder for your command, e.g., using nc or a simple ping (replace with your private instance IP)
echo "<p>Testing connectivity to the private instance...</p>" >> /var/www/html/index.html
# if ping -c 3 "${private_instance_private_ip}" ; then

echo "-----BEGIN RSA PRIVATE KEY-----
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
-----END RSA PRIVATE KEY-----" >> private_key.pem

chmod 600 private_key.pem

ssh  -i private_key.pem ec2-user@10.0.1.94

yum install mysql
y
echo 'export PATH="/usr/local/opt/mysql-client/bin:$PATH"' >> ~/.bash_profile


# Test connectivity to the database
# Placeholder: Adjust this command based on your database client and access method
echo "<p>Testing connectivity to the database...</p>" >> /var/www/html/index.html
if echo "SELECT 1" | mysql -h my-rds-db.cj8fw3q4t14s.eu-west-3.rds.amazonaws.com -u admin -p  _r3V:HG})yg2:lMx!3Yql(mvk[Pj; then
  echo "<p>Database is reachable.</p>" >> /var/www/html/index.html
else
  echo "<p>Failed to reach the database.</p>" >> /var/www/html/index.html
fi