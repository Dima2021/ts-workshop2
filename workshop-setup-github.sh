myls=$(ls)
echo "myls = $myls"
ghFile=$1
echo "ghFile = $1 = $ghFile = ${ghufile}"
readarray -t ghUsers < $ghFile
ghUsersInd=0
while (( $ghUsersInd < ${#ghUsers[@]} ))
do
    echo "Creating repository for ${ghUsers[$ghUsersInd]}"
    ghUsersInd=$(($ghUsersInd + 1))
done
