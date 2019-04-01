#!/bin/bash

# Check if arguments was passed
if [ $# != 2 ]
then
  echo "Please supply 2 arguments"
  exit 1
fi

oldName=$1
newName=$2

# Rename folders
echo "Folders renamed:"
# TODO: make regexp only for full words
folders=$(find . -name "*$oldName*" -type d)

#TODO: Sort folders by length
# indexes=($(
#     for i in "${!folders[@]}" ; do
#         printf '%s %s %s\n' $i "${#folders[i]}" "${folders[i]}"
#     done | sort -nrk2,2 -rk3 | cut -f1 -d' '
# ))

# for i in "${indexes[@]}" ; do
#     sorted+=("${folders[i]}")
# done

for folder in $folders
do
  newFolderName=${folder[@]//$oldName/$newName}
  echo "$folder => $newFolderName"
  mv $folder $newFolderName
done

# #Rename files
echo "Files renamed:"
# TODO: make regexp only for full words
files=$(find . -name "*$oldName*" -type f)
for file in $files
do
  # Renames only last occurence
  newFileName=$(sed "s/\(.*\)$oldName/\1$newName/" <<< $file)
  echo "$file => $newFileName"
  mv $file $newFileName
done
