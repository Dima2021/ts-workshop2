# The following environments are controlled /set via repository secrets when executed via GitHub actions (workflows).
export GITHUB_ORGS=("mendts-workshop" "mendts-workshop1" "mendts-workshop2")
export GITHUB_USERNAME=ts-whitesource
#export GITHUB_TOKEN=<get token from manager and set in shell before script>
export GH_USERS_PER_ORG=2

ghFile=$1
echo "ghFile=$1"
readarray -t ghUsers <$ghFile
ghUsersInd=0
while (($ghUsersInd < ${#ghUsers[@]})); do
    echo "Creating repository for ${ghUsers[$ghUsersInd]}"
    ghUsersInd=$(($ghUsersInd + 1))
done

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


# For each participant, create a GitHub repository & push the workshop project.
ghUsersInd=0
while (($ghUsersInd < ${#ghUsers[@]})); do

    # Calc organization index for GitHub organization
    orgInd=$(($ghUsersInd / $GH_USERS_PER_ORG))
    echo "Creating repository for ${ghUsers[$ghUsersInd]} within the ${GITHUB_ORGS[$orgInd]}" >> ../repocreated.txt

    echo "Creating a new repository for ${ghUsers[$ghUsersInd]} within the ${GITHUB_ORGS[$orgInd]} organization"
    curl -X POST -H 'Accept: application/vnd.github.v3+json' -u ${GITHUB_USERNAME}:${GITHUB_TOKEN} \
    https://api.github.com/orgs/${GITHUB_ORGS[$orgInd]}/repos -d '{"name":"'${ghUsers[$ghUsersInd]}'"}'

    echo "Adding ${ghUsers[$ghUsersInd]} as a new collaborator to ${GITHUB_ORGS[$orgInd]} organization"
    curl -X PUT -H 'Accept: application/vnd.github.v3+json' -u ${GITHUB_USERNAME}:${GITHUB_TOKEN} \
    https://api.github.com/repos/${GITHUB_ORGS[$orgInd]}/${ghUsers[$ghUsersInd]}/collaborators/${ghUsers[$ghUsersInd]} -d '{"permission":"admin"}'

    demoOrigin=https://github.com/${GITHUB_ORGS[$orgInd]}/${ghUsers[$ghUsersInd]}.git
    echo "Pushing easybuggy to $demoOrigin"
    git remote set-url origin $demoOrigin
    git push -u origin
	
    ghUsersInd=$(($ghUsersInd + 1))
done

cd .. && rm -rf easybuggy
