# Vlt Action

This GitHub Action retrieves secrets from HCP Vault and sets them as environment variables for your GitHub workflows.

## Usage

Include the action in your workflow configuration file (`.github/workflows/workflow.yml`):

```yaml
steps:
  - name: Checkout
    uses: actions/checkout@v2

  - name: Set up Vlt Action
    uses: aniemczyklmpl/vlt-action@v1
    with:
      hcp_client_id: ${{ secrets.HCP_CLIENT_ID }}
      hcp_client_secret: ${{ secrets.HCP_CLIENT_SECRET }}
      hcp_organization: ${{ env.HCP_ORGANIZATION }}
      hcp_project: ${{ env.HCP_PROJECT }}
      vlt_application_name: ${{ env.VLT_APPLICATION_NAME }}
      secrets_map: | 
        vlt_key_one | variable_name_one; 
        vlt_key_two | variable_name_two
```

## Inputs

The action requires the following inputs:

- `hcp_client_id`: Your HCP client ID.
- `hcp_client_secret`: Your HCP client secret.
- `hcp_organization`: Your HCP organization.
- `hcp_project`: Your HCP project.
- `vlt_application_name`: Your Vlt application name.
- `secrets_map`: A map of secrets to retrieve from the vault. The format is `vault_key|env_var_name;vault_key|env_var_name;...`.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.