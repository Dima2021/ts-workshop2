#export WS_APIKEYS="apiKey, apiKey1, apiKey2"
#export WS_USERKEYS=("userKey, userKey1, userKey2"
#export WS_WSS_URL=https://saas.mend.io/api/v1.3
#export GH_USERS_PER_ORG=2
export WS_INVITER=facilitator@gmail.com
export WS_USER_GROUP=admins

emailsFile=$1
readarray -t emails <$emailsFile

# Remove all spaces and split WS_APIKEYS based on the delimiter ','
WS_APIKEYS=$(echo $WS_APIKEYS | tr -d ' ')
IFS=','; read -ra apiKeys <<< "$WS_APIKEYS"

# Remove all spaces and split WS_APIKEYS based on the delimiter ','
WS_USERKEYS=$(echo $WS_USERKEYS | tr -d ' ')
IFS=','; read -ra userKeys <<< "$WS_USERKEYS"

emailsInd=0
while (($emailsInd < ${#emails[@]})); do
#   echo "email $emailsInd is ${emails[$emailsInd]}"
   emailsPerOrg+="${emails[$emailsInd]}, "
   assignedUsers+="{'email':'${emails[$emailsInd]}'}, "
   emailsInd=$(($emailsInd + 1))

   # Mend users who will be participating in a (single) Mend organization.
   if (($(($emailsInd % $GH_USERS_PER_ORG)) == 0)) || (($emailsInd == ${#emails[@]})); then
        # Calc organization index for API and User keys
        orgInd=$((($emailsInd / $GH_USERS_PER_ORG) -1))
        if  (($emailsInd == ${#emails[@]})) && (($GH_USERS_PER_ORG > 1)); then
          orgInd=$(($orgInd + 1))
        fi

        # Remove last comma
        emailsPerOrg=$(echo $emailsPerOrg | sed 's/,$//')
        assignedUsers=$(echo $assignedUsers | sed 's/,$//')

        # Uncomment for debug/troubleshooting purposes
#       echo -e "\norgInd=$orgInd, APIKEY=${apiKeys[$orgInd]}, USERKEY=${userKeys[$orgInd]}, emailsPerOrg=$emailsPerOrg, assignedUsers=$assignedUsers"

        echo -e "\nOrg #$orgInd: Invite Users to an Organization"
        curl --request POST -H "Content-Type:application/json" $WS_WSS_URL \
       -d "{'requestType':'inviteUsers', 'userKey':'${userKeys[$orgInd]}', 'orgToken':'${apiKeys[$orgInd]}', 'inviter':{'email':'$WS_INVITER'}, 'emails':[$emailsPerOrg]}"

        echo -e "\nOrg #$orgInd: Add Users to ${WS_USER_GROUP} Group"
        curl --request POST -H "Content-Type:application/json" $WS_WSS_URL \
        -d "{'requestType':'addUsersToGroups', 'userKey':'${userKeys[$orgInd]}', 'orgToken':'${apiKeys[$orgInd]}', 'assignedUsers':[[{'name':'$WS_USER_GROUP'}, [${assignedUsers}$
        # Init for the next Mend organization
        emailsPerOrg=""
        assignedUsers=""
    fi
done
