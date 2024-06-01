#!/bin/bash

while true; do
echo  "Enter a number of exersise from 1 to 9: "
read choise


case $choise in
	exit) break;;
	1)
	echo "Hello world";;

	2)
	echo "Write your name:"
	read name
	echo "Hello $name, nice to see you here!";;

	3)
	echo "Write a file and a dir, which you want to check:"
	read -p "File name: " file
	read -p "Directory: " dir
	dir=$(eval echo "$dir")
	fullpath="$dir/$file"
	if [ -e "$fullpath" ]; then
    		echo "File '$file' exists in directory '$dir'."
	else
    		echo "File '$file' does not exist in directory '$dir'."
	fi;;

	4)
	echo "Write numbers from and to you want to count:"
	echo "First:"
	read first_num
	echo "Second:"
	read second_num
	for ((i = first_num; i <=second_num; i++)); do
		echo "$i"
	done;;

	5)
	read -p "Enter the path to the source file: " source_file
	read -p "Enter the destination dir:" destination_directory


	if [ ! -e "$source_file" ]; then
    	echo "Error: The specified source file '$source_file' does not exist."
    	exit 1
	fi


	if [ ! -d "$destination_directory" ]; then
    	echo "Error: The specified destination directory '$destination_directory' does not exist."
	exit 1
	fi


	cp "$source_file" "$destination_directory"


	if [ $? -eq 0 ]; then
	echo "File '$source_file' copied to '$destination_directory' successfully."
	else
	echo "Error: Failed to copy the file to the specified destination directory."
	fi;;

	6)
	echo "Write a string, and I am going to reverse it!"
	read str
	echo "$str" | tr ' ' '\n' | tac | xargs;;

	7)

	read -p "Write a file, and I am tell a count of rows:" file_name
                echo "Number of rows:"
                cat "$file_name" | wc -l;;


	8)
	fruits=(banana apple pear)
	for a in "${fruits[@]}"
	do
	echo "$a"
	done;;

	9)
	read -p "Write a file name:" file_name
	if  [ -f "$file_name" ]; then
		echo "The content of file:"
		cat "$file_name"
	else
		echo "Oops, file  does not exist "
	fi;;

	*)
	echo  "Unknow"
	;;
	esac
done
