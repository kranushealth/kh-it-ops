#!/usr/bin/env bash

# Set the array of vault names
VAULT_ARRAY=("infra-de-dev" "infra-de-prod" "infra-dev" "infra-prod" "infra-fr-dev" "infra-fr-prod")

# Loop through all vaults
for VAULT in ${VAULT_ARRAY[@]}; do
    # Set the name of the original vault
    ORIGINAL_VAULT_NAME=$VAULT

    # Set the name of the new vault
    NEW_VAULT_NAME="$ORIGINAL_VAULT_NAME-backup-$(date +%m-%Y)"

    # Create the new vault
    op vault create "$NEW_VAULT_NAME" --allow-admins-to-manage false --icon vault-door

    # Set the permissions for the new vault
    op vault user grant --vault "$NEW_VAULT_NAME" --user "ndimolarov@kranushealth.com" \
        --permissions allow_viewing,allow_editing
    op vault user grant --vault "$NEW_VAULT_NAME" --user "nkopylov@kranushealth.com" \
        --permissions allow_viewing,allow_editing
    op vault user grant --vault "$NEW_VAULT_NAME" --user "obenedetti@kranushealth.com" \
        --permissions allow_viewing,allow_editing
    op vault user grant --vault "$NEW_VAULT_NAME" --user "dnedelcu@kranushealth.com" \
        --permissions allow_viewing,allow_editing
  #  op vault user grant --vault "$NEW_VAULT_NAME" --user "sdimitrov@kranushealth.com" \
   #     --permissions allow_viewing,allow_editing

    # Copy all items from the original vault to the new vault
    for item in $(op item list --vault "$ORIGINAL_VAULT_NAME" --format=json | jq --raw-output '.[].id')
    do
        op item get $item --format json | op item create --vault "$NEW_VAULT_NAME"
    done
done