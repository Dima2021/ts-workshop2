myls=$(ls)
echo "myls = $myls"
#ghFile=$1
#echo "ghFile = $1 = $ghFile"
ghFile="ghusers.txt"
readarray -t ghUsers < $ghFile
echo "after readarray"

lines=`cat $ghFile`
for line in $lines; do
   echo "$line"
done
