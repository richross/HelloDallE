# based off of the instructions at this url
# https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure?tabs=azure-cli%2Cwindows

# commands for creating the app reg and service principal for GitHub OID Federation

$appId = az ad app create --display-name "HelloDallE_GHAction"

$objectId = az ad sp create --id $appId

az role assignment create --role contributor --subscription $subscription --assignee-object-id $objectId --assignee-principal-type ServicePrincipal --scope /subscriptions/$subscription

# Add Federated Credential to the App Registration
az ad app federated-credential create --id $appId --parameters credential_ref_main.json
