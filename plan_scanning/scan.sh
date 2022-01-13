terraform plan --out ./main.tfplan
terraform show -json main.tfplan > ./main.json
checkov -f ./main.json --external-checks-dir ../policies/