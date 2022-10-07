# Number of users participating in a (single) GH/SCA/SAST organization.
# Below is the current setup, which includes 3 GitHub, SCA, and SAST organizations.
#1. ts-whitesource (https://github.com/wsts-workshop) -> MendTS-Workshop (https://saas.mend.io) -> MendTS-Workshop (https://sast.mend.io)
#2. ts-whitesource (https://github.com/wsts-workshop1) -> MendTS-Workshop1 (https://saas.mend.io) -> MendTS-Workshop1 (https://sast.mend.io)
#3. ts-whitesource (https://github.com/wsts-workshop2) -> MendTS-Workshop2 (https://saas.mend.io) -> MendTS-Workshop2 (https://sast.mend.io)
# It is recommended that organizations have up to 20 users.
export GH_USERS_PER_ORG=20

# GitHub parameters (workshop-setup-github.sh script):
# You can obtain the GH Token from your manager.
export GH_TOKEN=ghp_token
export GH_ORGS="mendts-workshop, mendts-workshop1, mendts-workshop2"
export GH_USERNAME=ts-whitesource
export GH_BRANCH=easybuggy

# SCA parameters (workshop-setup-sca.sh script):
# You can obtain the API tokens and User keys from MendTS-Workshop/1/2 orgs and tsworkshop/1/2 service users.
export WS_APIKEYS="apiKey, apiKey1, apiKey2"
export WS_USERKEYS="userKey, userKey1, userKey2"
export WS_WSS_URL="https://saas.mend.io/api/v1.3"
export WS_INVITERS="tsworkshop@whitesourcesoftware.com, tsworkshop1@whitesourcesoftware.com, tsworkshop2@whitesourcesoftware.com"

# SAST parameters (workshop-setup-sast.sh script):
# You can obtain the API tokens from MendTS-Workshop/1/2 orgs.
export SAST_API_TOKENS="apiToken, apiToken1, apiToken2"
export SAST_URL=https://sast.mend.io/sast

# GitHub script:
# The GitHub setup script will create a repository in the https://github.com/wsts-workshop organizations according to the ghusers.txt list.
# The repository is created with the same name as the GitHub user, and gives that user admin privileges.
# Lastly, the workshop project (from the specified branch) is pushed to the repository.
# The GitHub users are listed in the ghusers.txt file (do not use commas, just line separated) 
chmod +x ./workshop-setup-github.sh && ./workshop-setup-github.sh ghusers.txt

# SCA script:
# The SCA setup script (workshop-setup-sca.sh) will add the email address as an administrator to MendTS-Workshop organizations in https://saas.mend.io.
# The emails are listed in the emails.txt file (do not use commas, just line separated)
chmod +x ./workshop-setup-sca.sh && ./workshop-setup-sca.sh emails.txt

# SAST script:
# Uncomment the row below if workshop participants should have access to SAST (disabled by default).
# The SAST setup script (workshop-setup-sast.sh) will add the email address as an administrator to MendTS-Workshop organizations in https://sast.mend.io.
# The emails are listed in the emails.txt file (do not use commas, just line separated)
chmod +x ./workshop-setup-sast.sh && ./workshop-setup-sast.sh emails.txt
