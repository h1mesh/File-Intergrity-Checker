#! /bin/bash

#This is a script to calculate hash value of a file and compare it with known hash value.

read -p "File path: " file_path
read -p "Known hash Value: " known_hash

#check the file path is correct

if [ -f $file_path ]
then
	echo "exists"
	calculated_hash=$(sha256sum "$file_path" | cut -d " " -f 1)
	#echo $calculated_hash
	
	if [ "$calculated_hash" == "$known_hash" ]
	then 
		echo $file_path"'s Intergrity is Verified"
	else
		echo $file_path"'s Intergrity isn't Verified"
	fi
else
	echo "Oops..! something went wrong"
fi
