# Import the Microsoft Graph API client
Import-Module Microsoft.Graph

# Authenticate to the Microsoft Graph API
$cred = Get-StoredCredential -Target "OneDrive Credentials"

Connect-MicrosoftGraph -Credential $cred

# Get the shared files in the user's OneDrive
$sharedFiles = Get-MicrosoftGraphSharedItem -Filter "driveItem/sharedByMe eq true"

# Re-share each file
foreach ($file in $sharedFiles) {
  # Set the permissions for the file
  Set-MicrosoftGraphSharingLink -ItemId $file.Id -Type View -Scope Anyone
}
