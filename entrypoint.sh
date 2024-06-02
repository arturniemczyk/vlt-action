#!/bin/bash

SECRETS_MAP=$(echo $SECRETS_MAP | tr -d '[:blank:]')
IFS=';' read -r -a secrets_array <<< "$SECRETS_MAP"

for secret_pair in "${secrets_array[@]}"; do
    IFS='|' read -r vlt_key new_var <<< "$secret_pair"
    secret_value=$(vlt secrets get --plaintext "$vlt_key")
    echo "::add-mask::$secret_value"
    if [ $? -eq 0 ]; then
        echo "$new_var=$secret_value" >> $GITHUB_ENV
    else
        echo "Error: Failed to retrieve value for key $vlt_key"
        exit 1
    fi
done