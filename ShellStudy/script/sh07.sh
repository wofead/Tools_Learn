#########################################################################
# File Name: sh07.sh
# Author: Houn
# mail: 614667387@qq.com
# Created Time: 2017年07月30日 星期日 20时44分19秒
# Program: This program 
# Version: First release 
#########################################################################
#!/bin/bash


users=$(cut -d ":" -f1 /etc/passwd)
echo $users
for username in $users
do
   echo "id $username"
   echo "finger $username"
done
