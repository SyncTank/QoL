#!/bin/sh
 addpath(){
 if [ $# -eq "2" ];
 then
 if [[ $1 == *"/"* ]];
 then
 if [ -z "$1" ] && [ -z "$2" ];
 then
 printf "\n"
 echo " $# arugments var2 is empty"
 printf "\n"
elif [ "$1" ] && [ -z "$2" ];
then
 printf "\n"
 $PATH
 printf "\n"
 echo " $# arguments var2 is half empty"
 echo " $1"
 printf "\n"
 PATH="$PATH:$1"
 $PATH
 printf "\n"
else
 printf "\n"
 $PATH
 printf "\n"
 echo " $# arguments var2 is NOT empty"
 printf "\n"
 echo " Paths  will be added"
 echo " $1"
 echo " $2"
 printf "\n"
 #pathsadded here
 PATH="$PATH:$1"
 PATH="$PATH:$2"
 $PATH
 printf "\n"
 fi
 else
 echo
 echo  " Invaild parameters, Try again"
 echo
 fi
 fi
}
 repath(){
 printf "\n"
 echo " Old Path"
 echo $PATH
 printf "\n"
 source /etc/environment
 echo " Defaulted Path"
 echo $PATH
 printf "\n"
}
 runa(){
echo
echo "Running $1"
echo
$(pwd)/$1
}
