#!/bin/bash

directoryName="copied"
isRecursive=false

exec_recursive() {
  find . -maxdepth 1 -type d ! -name "$directoryName" -exec mkdir {}/$directoryName \;
  #-name "copied" to avoid creating 2 nested "copied" directory in main directory

find . -maxdepth 1 -type d ! -name "$directoryName" | while read -r dir; do
  find "$dir" -maxdepth 1 -name "$1" -exec cp {} "$dir/$directoryName" \; 
  echo "Files with wildcard '$1' are copied to '$dir/$directoryName'."
done

}

# Check if option exists
if [[ $1 == "-R" ]];
then
  isRecursive=true
  shift
fi


# Find and copy files
if [[ $isRecursive == true ]];
then
  exec_recursive "$1" "$directoryName"
  
elif [[ $isRecursive == false ]];
then
  mkdir -p "$directoryName"
  find . -maxdepth 1 -type f -name "$1" -exec cp {} "$directoryName" \;
  
fi

echo "Please, check the file."
