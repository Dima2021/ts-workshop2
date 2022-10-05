echo "ls"
ls
echo "end of ls"
ghFile=$1
readarray -t ghUsers < "$ghFile"
ghUsersInd=0
while (($ghUsersInd < ${#ghUsers[@]}))
do
    echo "Creating repository for ${ghUsers[$ghUsersInd]}"
    ghUsersInd=$(($ghUsersInd + 1))
done
