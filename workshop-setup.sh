# Number of users participating in a (single) GH/SCA/SAST organization.
export GH_USERS_PER_ORG=20

# GitHub script:
# You can obtain the GH Token from your manager.
export GH_TOKEN=ghp_token
export GH_ORGS="mendts-workshop, mendts-workshop1, mendts-workshop2"
export GH_USERNAME=ts-whitesource
export GH_BRANCH=easybuggy
chmod +x ./workshop-setup-github.sh && ./workshop-setup-github.sh ghusers.txt

# SCA script:
# You can obtain API tokens and User keys from MendTS-Workshop/1/2 orgs and tsworkshop/1/2 service users.
export WS_APIKEYS="apiKey, apiKey1, apiKey2"
export WS_USERKEYS="userKey, userKey1, userKey2"
export WS_WSS_URL="https://saas.mend.io/api/v1.3"
export WS_INVITERS="tsworkshop@whitesourcesoftware.com, tsworkshop1@whitesourcesoftware.com, tsworkshop2@whitesourcesoftware.com"
chmod +x ./workshop-setup-sca.sh && ./workshop-setup-sca.sh emails.txt

# SAST script - Uncommented in order to set up SAST organizations for workshop participants.
# You can obtain API tokens from MendTS-Workshop/1/2 orgs.
export SAST_API_TOKENS="apiToken, apiToken1, apiToken2"
export SAST_URL=https://sast.mend.io/sast
#chmod +x ./workshop-setup-sast.sh && ./workshop-setup-sast.sh emails.txt
