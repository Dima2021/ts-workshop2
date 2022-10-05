myls=$(ls)
echo "myls = $myls"
ghFile=$1
echo "ghFile = $1 = $ghFile"
readarray -t ghUsers < $ghFile
echo "after readarray"

lines=`cat $ghFile`
for line in $lines; do
   echo "$line"
done
