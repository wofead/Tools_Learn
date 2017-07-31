#########################################################################
# File Name: sh04.sh
# Author: Houn
# mail: 614667387@qq.com
# Created Time: 2017年07月30日 星期日 18时56分06秒
# Program: This program cal two number
# Version: First release 
#########################################################################
#!/bin/bash


read -p "Please inpute the first number:" firstnum
read -p "Please inpute the second number: " secondnum
total=$(($firstnum*$secondnum))
echo -e "\n The total is: $total"
