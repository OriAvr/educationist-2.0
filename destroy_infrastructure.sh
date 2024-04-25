#!/bin/bash

cd code/compute


terraform destroy --auto-approve

cd ../data


terraform destroy --auto-approve

aws secretsmanager delete-secret --secret-id "db_password" --force-delete-without-recovery

cd ../network


terraform destroy --auto-approve

