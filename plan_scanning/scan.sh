terraform plan --out ./main.tfplan
terraform show -json main.tfplan > ./main.json
checkov -f ./main.json --external-checks-dir ../policies/ --skip-check "CKV2_AZURE_1, CKV2_AZURE_18"