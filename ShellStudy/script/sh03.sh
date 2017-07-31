#########################################################################
# File Name: sh03.sh
# Author: Houn
# mail: 614667387@qq.com
# Created Time: 2017年07月30日 星期日 18时22分30秒
# Program: This program named file with date
# Version: First release 
#########################################################################
#!/bin/bash

PATH=$PATH:$(pwd)
export PAth

echo -e "I will use touch create three file.\n"
read -p "Please input filename: " fileuser

#利用变量功能判断文件名是否设置
filename=${fileuser:-"filename"}
date1=$(date --date='2 days ago' +%Y%m%d)
date2=$(date --date='1 days ago' +%Y%m%d)
date3=$(date +%Y%m%d)
file1=${filename}${date1}
file2=${filename}${date2}
file3=${filename}${date3}

touch "$file1"
touch "$file2"
touch "$file3"
