#!/bin/sh

addpass(){
printf "\n"
echo " Please enter three intergers"

read var1
read var2
read var3

printf "\n"

echo " Choose a function"
echo " (1) Sumation"
echo " (2) Average"

read var4 #can be into as 1 | 2 

if [ $var4 -eq 1 ];then 
var5=$((var1+var2+var3))
echo " $var1 + $var2 + $var3 = $var5 "

elif [ $var4 -eq 2 ];then 
var6=$((var1+var2+var3))
var5=$(((var6)/3))
echo " ( $var1 + $var2 + $var3 ) / 3 = ($var6)/3 = $var5 "
else echo " Unknow parameter, please try again "
fi
}

