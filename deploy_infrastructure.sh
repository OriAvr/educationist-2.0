#!/bin/bash

cd code/network

terraform init

terraform apply --auto-approve

cd ../data

terraform init

terraform apply --auto-approve

cd ../compute

terraform init

terraform apply --auto-approve