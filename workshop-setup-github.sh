# The following environments are controlled /set via repository secrets when executed via GitHub actions (workflows).
#export GITHUB_ORGS=("mendts-workshop" "mendts-workshop1" "mendts-workshop2")
#export GITHUB_USERNAME=ts-whitesource
#export GITHUB_TOKEN=<get token from manager and set in shell before script>
#export GH_USERS_PER_ORG=2

ghFile=$1

# Delete the repocreated.txt file, in case it exists from the previous interactions.
if [ -e "repocreated.txt" ]; then
    rm repocreated.txt
fi

workshopProjDir=$PWD/easybuggy
# Clone the workshop project if it doesn't already exist. E.g. easybuggy.
if [ -d "$workshopProjDir" ]; then
   cd $workshopProjDir && echo "$workshopProjDir exists"
else
   git clone https://github.com/k-tamura/easybuggy.git && cd ./easybuggy
   git config --local url."https://${GITHUB_TOKEN}@github.com".insteadOf "https://github.com"
fi
