#########################################################################
# File Name: sho1.sh
# Author: Houn
# mail: 614667387@qq.com
# Created Time: 2017年07月30日 星期日 16时13分09秒
# Program:
#   This program shows "Hello world!" in your screen.
# Version : First release
#########################################################################
#!/bin/bash
PATH=$PATH:$(pwd)
echo -e "$PATH \a \n"
export PATH
echo -e "Hello world! \a \n"
#利用exit 0 来判断程序是否成功 echo $? 即可
exit 0

