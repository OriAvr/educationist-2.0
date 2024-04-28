## Description

This Terraform code allows you to create the following resources:

- VPC
- Public subnets
- Private Subnets
- Internet Gateway
- Private EC2 instances
- Public EC2 instances
- Security Groups
- RDS instance
- S3 bucket(for static content)

By default, it is set up to include 1 public and 1 private subnet, as well as a separate private subnet for your DB.

## Prerequisites

To get started with the project, you need:

- Terraform CLI set up.
- AWS CLI set up and loaded with credentials.
- An initialized Git repository.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installation

Step-by-step series of examples and explanations about how to get a development environment running.

1. **Clone the Repository**
   ```bash
   git clone https://github.com/OriAvr/educationist-2.0.git
   cd educationist-2.0.git
   ```
2. **Allow the script access for running your code.**

   ```bash
   chmod +x deploy_infrastructure.sh
   ```

3. **Run the script to build the infrastructure**
   ```bash
   deploy_infrastructure.sh
   ```
