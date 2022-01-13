terraform plan --out ./main.tfplan
terraform show -json main.tfplan > ./main.json

#Note no spaces inside skip checks or it wont work
checkov -f ./main.json --external-checks-dir ../policies/ --skip-check "CKV2_AZURE_1,CKV2_AZURE_18"