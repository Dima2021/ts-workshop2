ghFile=$1
readarray -t ghUsers <$ghFile

# Delete the repocreated.txt file, in case it exists from the previous interactions.
if [ -e "repocreated.txt" ]; then
   rm repocreated.txt
fi
