Example showing how to use terraform for Google Key Management Service Resources

### Steps:
- Set variables:
```
export TF_VAR_gcp_credentials="path/to/credentials/file"
export TF_VAR_gcp_project="gcp-project-name"
export TF_VAR_kms_key_ring_name=""
export TF_VAR_kms_key_name=""
```
- Optionally set a region (default is `us-central1`): `export TF_VAR_gcp_region="us-east1"`
- Run terraform commands:
```
terraform init
terraform plan
terraform apply
```
- Cleanup:
```
terraform destroy
unset TF_VAR_gcp_credentials
unset TF_VAR_gcp_project
```
- Manual cleanup of keyring and key:
Sometimes a `terraform destroy` may not be successful of the keyring is already in a destroy scheduled state. In that case the resources will continue to stay around in terraform state file and you may need to remove them manually from the state file. Below are example commands to achieve this:
** Note: please use these commands with care as it will remove resources from terraform management **

  - Make a backup of the tfstate file: `cp terraform.tfstate terraform.tfstate.backup.$(date "+%Y%m%d-%H%M%S")`
  - Use the commands to display existing resources in state file:
```
terraform state list
terraform state show google_kms_crypto_key.my_crypto_key
terraform state show google_kms_key_ring.my_key_ring
```
  - Remove the `google_kms_crypto_key` resource from state file:
```
terraform state rm google_kms_crypto_key.my_crypto_key
```
  - Remove the `google_kms_key_ring` resource from state file:
```
terraform state rm google_kms_key_ring.my_key_ring
```
