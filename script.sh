# The script to get the basic information about the user specified file, and then print the information on the console screen.
#
# Author : Rishav Das (https://github.com/rdofficial)
# Created on : April 28, 2021
#

# Defining the ANSII color codes
RED='\033[91m'
GREEN='\033[92m'
YELLOW='\033[93m'
BLUE='\033[94m'
DEFCOL='\033[00m'

# Checking if the user entered the file location in the arguments while calling this script
if [[ -z $1 ]]; then
	# If the user did not entered the file location in the arguments, then we ask the user for the file location manually

	read -p "Enter the file location : " filename
else
	# If the user did entered an argument while calling the script, then we consider the first argument as the file location

	filename=$1
fi
echo -e ""

# Finding out the information about the user specified file one by one
echo -e "Information of the requested file '${YELLOW}${filename}${DEFCOL}' is as follows :"
if [[ -d $filename ]]; then
	# If the user specified location is of a diretory, then we print on the console screen about it not being a file

	echo -e "[${RED}!${DEFCOL}] The specified location is a directory : ${YELLOW}${filename}${DEFCOL}"
elif [[ -f $filename ]]; then
	# If the user specified location is of a file, then we continue

	# Checking read permissions
	if [[ -r $filename ]]; then
		# If the user specified file has read permissions, then we display it

		echo -e "[${GREEN}#${DEFCOL}] Read permissions : ${GREEN}Yes${DEFCOL}"
	else
		# If the user specified file does not have read permissions, then we display it

		echo -e "[${RED}!${DEFCOL} Read permissions : ${RED}No${DEFCOL}"
	fi

	# Checking write permissions
	if [[ -w $filename ]]; then
		# If the user specified file has write permissions, then we display it

		echo -e "[${GREEN}#${DEFCOL}] Write permissions : ${GREEN}Yes${DEFCOL}"
	else
		# If the user specified file does not have write permissions, then we display it

		echo -e "[${RED}!${DEFCOL}] Write permissions : ${RED}No${DEFCOL}"
	fi

	# Checking wheter executable or not
	if [[ -x $filename ]];then
		# If the user specified file is executable, then we display it

		echo -e "[${GREEN}#${DEFCOL}] Executable : ${GREEN}Yes${DEFCOL}"
	else
		# If the user specified file is not executable, then we display it

		echo -e "[${RED}!${DEFCOL}] Executable : ${RED}No${DEFCOL}"
	fi
else
	# If the user specified location is neither of a file nor of a directory, then we display the error message on the console screen

	echo -e "[${RED}!${DEFCOL}] The specified location '${YELLOW}${filename}${DEFCOL}' is neither of a folder nor of a file"
fi
