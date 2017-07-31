#########################################################################
# File Name: sh06.sh
# Author: Houn
# mail: 614667387@qq.com
# Created Time: 2017年07月30日 星期日 20时20分17秒
# Program: This program 
# Version: First release Second Threeth
#########################################################################
#!/bin/bash

function printit(){
    echo "Your choice is $1"
}
case $1 in
    "1")
        printit 1;echo "Your choice is 1."
        ;;
    "2")
        echo "Your choice is 2"
        ;;
    "3")
        echo "Your choice is 3"
        ;;
    *)
        echo "Usage $0 {one|two|three}"
        ;;
esac
