#!/bin/bash

########################################################################
# 
# filechecker.sh.pseudocode - MNXB01-2022 Homework 3
#
# Author: Florido Paganelli florido.paganelli@hep.lu.se
#
# Description: This script takes as input 
#                 - a URL to some website
#              - It downloads the file in a temporary file using wget
#              - Checks info about the file using the file command
#              - Removes the temporary file
#
# Example usage:
#        ./filechecker.sh https://www.hep.lu.se/courses/MNXB01/index.html
#
# Note: The slide numbers in the pseudocode below refer to Tutorial3
#       if not otherwise stated.
#
########################################################################

#### Evaluation of the score ######################################
# 
# The script submitted must run without any further editing by the teacher.
#
# The maximum points for this homework are 8 out of 6 Exercises.
# Each Exercise shows how many points it yields.
# 
# I will grade the homework based on this scale:
# Score 0-2: Grade 1, failed, not acceptable
# Score 3-4: Grade 2, poor, needs improvement
# Score 5-6: Grade 3,  acceptable solution, a pass
# Score 7: Grade 4,  good, mostly complete, with some shortcomings
# Score 8: Grade 5, excellent
#
# Previous year experience shows that half points might be awarded. 
#
# Resubmission rules follow the page at
# https://canvas.education.lu.se/courses/19137/pages/grading-scheme-and-deadlines?module_item_id=623303
#
# The deadline is on Canvas.
#
########################################################################

#### DO NOT MODIFY THE CODE BELOW ######################################

# This function takes no parameters. It prints out how to use the 
# script.
missingparam(){
   echo "Missing first parameter"
   echo "Usage:"
   echo "   $0 <URL>"
   echo
   echo "Example:"
   echo "    $0 https://www.hep.lu.se/"
   echo "exiting..."
}

#### END OF UNTOUCHABLE CODE ###########################################

######### START OF HOMEWORK CODE #######################################

# Edit the code below
# Replace the lines YOUR_CODE_HERE with your own code.
# it could mean you have to write multiple lines of code.

# E1 (1 point) Store the parameter in a variable called REMOTEFILE
# See slides 42-43 about parameters
REMOTEFILE=$1

# E2 (2 points) If the user forgot the parameter,
# print out a message using the function missingparam() defined above
# and exit with error code.
# See slides 46-55 ('if' statement, exit and process status), 59-63 (functions)
if [[ "x$REMOTEFILE" == 'x' ]]; then
   missingparam
   exit 1
fi


# E3 (1 point) Create a temporary file in current directory using the
# `mktemp` command, and store the filename inside a variable called 
# TMPFILE.
# For executing commands and storing their standard output in a variable,
# read slide 56
# Read about mktemp here: 
# <https://linuxconfig.org/how-to-create-temporary-files-using-mktemp-on-linux>
# <https://www.baeldung.com/linux/mktemp-command>
TMPFILE=$(mktemp -p ./)

# DO NOT MODIFY START #
echo
echo "Downloading file $REMOTEFILE into $TMPFILE using wget"
# DO NOT MODIFY END #

# E4 (1 point) Use the wget command to download
# write the downloaded file to the temporary file
# generated above.
# Read about how to use wget here:
# <https://opensource.com/article/21/10/linux-wget-command>
# <https://www.digitalocean.com/community/tutorials/how-to-use-wget-to-download-files-and-interact-with-rest-apis>
wget -O $TMPFILE $REMOTEFILE 

# E5 (1 point) Store the exit code of wget in a variable WGETSTATUS
# Read slides 44-45 about status and exit codes.
WGETSTATUS=$?

# DO NOT MODIFY START #
# Test if the download went well (if wget exited with no error)
# If any error, remove the temporary file, exit with error.
if [[ $WGETSTATUS -ne 0 ]]; then
   echo "Error, download failed, check URL of input parameter: '$REMOTEFILE'. Exiting...";
   rm $TMPFILE
   exit 1
fi

echo
echo "Checking $TMPFILE properties with the 'file' command..."
# DO NOT MODIFY END #

# E6 (2 points) Use the "file" command to test file properties.
# use it once without parameters for basic info
# use it again to show the "mime type" of the file.
# See these pages on how to use the `file` command:
# <https://linuxhandbook.com/file-command/>
# <https://www.hostinger.com/tutorials/linux-file-command/>
echo "Basic info:"
file $TMPFILE
echo "MIME info:"
file -i $TMPFILE

# DO NOT MODIFY START #
echo
echo "Removing $TMPFILE"
# Delete the temporary file.
rm $TMPFILE

echo
# DO NOT MODIFY END #
