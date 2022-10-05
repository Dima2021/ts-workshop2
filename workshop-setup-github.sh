ghFile=$1

# Delete the repocreated.txt file, in case it exists from the previous interactions.
if [ -e "repocreated.txt" ]; then
   rm repocreated.txt
fi
