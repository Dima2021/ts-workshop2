# The following environments are controlled /set via repository secrets when executed via GitHub actions (workflows).
#export GITHUB_ORGS=("mendts-workshop" "mendts-workshop1" "mendts-workshop2")
#export GITHUB_USERNAME=ts-whitesource
#export GITHUB_TOKEN=<get token from manager and set in shell before script>
#export GH_USERS_PER_ORG=2

ghFile=$1
echo ghFile=$ghFile
readarray -t ghUsers <$ghFile
