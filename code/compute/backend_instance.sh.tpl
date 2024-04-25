#!/bin/bash

# Update the system
yum update -y

yum install mysql -y

# Install Git
yum install git -y

# Install Node.js
curl -sL https://rpm.nodesource.com/setup_16.x | bash -
yum install nodejs -y

git clone https://github.com/OriAvr/testing-app-backend.git /var/www/myserver

cd /var/www/myserver

# Install npm dependencies
npm install

# Install dotenv for variables
npm install dotenv

# Set env variables for database connection
cat << EOF > .env
DB_HOST=${db_host}
DB_USER=${db_username}
DB_PASSWORD=${db_password}
DB_NAME=${db_name}
EOF

npm install pm2 -g
pm2 start server.js
pm2 save
pm2 startup


