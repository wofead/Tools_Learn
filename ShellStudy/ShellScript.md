# 学习shellscript
## 执行方式
1. 绝对路径:使用/home/dmsd/shell.sh来执行命令
2. 相对路径:./shell.sh来执行
3. PATH指定的目录，使用 "bash shell.sh"or"sh shell.sh"来执行
4. 利用source执行shell文件，__这种执行方式和上面三种的不同之处在于不会创建新的进程，直接在父进程执行__
## 对shell脚本的初步认识
1. 命令从上倒下，从左到右地分析和执行的
2. 命令和参数间的空白都会被忽略
3. 读到[enter]开始尝试该串命令
4. 扩展倒下一行[enter]
5. 注释使用#号
6. #!/bin/bash 声明这个文件使用的是bash语法
## 设立了脚本的书写习惯
1. script的功能
2. script的版本信息
3. script的作者和联系方式
4. script的版权声明方式
5. script的History
6. script内叫特殊的命令，使用“绝对路径”的方式来执行
7. 执行时需要的环境变量预先声明与设置
## 好的习惯
1. var=$((运算内容))   




## test的应用
1. 关于某个文件名“文件类型”判断，如__test -e filename__表示存在否

|测试的标志|代表的意义|
|----------|----------|
|-e|该文件名是否存在|
|-f|该文件名是否存在且为文件|
|-d|该文件是否存在且为目录|
|-b|...且为一个block device设备|
|-c|...为character device设备|
|-S|...为Socket文件|
|-p|...为FIFO（pipe）文件|
|-L|...为链接文件|

2. 关于文件权限的测试

|测试的标志|代表的意义|
|----------|----------|
|-r|...具有可读|
|-w|...具有可写|
|-x|...具有可执行|
|-u|...具有SUID属性|
|-g|...具有SGID属性|
|-k|...具有Sticky bit属性|
|-s|...非空白文件|

3. 两个文件之间的比较 __test file1 -nt file2__

|测试的标志|代表的意义|
|----------|----------|
|-nt|newer than|
|-ot|older than|
|-ef|判断两个文件是否一样|

4. 关于两个整数之间的比较 __test n1 -eq n2__

|测试的标志|代表的意义|
|----------|----------|
|-eq|equal|
|-ne|not equal|
|-gt|greater|
|-lt|less|
|-ge|大等|
|-le|小等

5. 判断字符串的数据 

|测试的标志|代表的意义|
|----------|----------|
|Test -z string | 判断是否为空，空为true|
|Test -n string| 为空false|
|Test str1= str2| 相等true|
|Test str1!=str2|不等true|

6. 多重条件判断,__ test -r filename  -a -x filename__ 同时满足r和x为true

|测试的标志|代表的意义|
|----------|----------|
|-a|等于and|
|-o|等于or|
|!|等于非|
## 利用判断符号[]
[] 等于test,参数和使用方法一样
## sh的参数
1. $# : 参数的个数，等于argc+1
2. $@ : 全部参数
3. $0 : 名字
4. $1 : 第一个参数
## if[条件判断]||[条件判断];then 执行语句  fi//结束标志
if[];  then   elif[];  then else fi   //其中空格表示执行语句
## case
case $var in  
  "第一个变量的内容")//符合第一个  
    程序段  
    ;;  
  "第二个变量的内容") //符合第二个  
    程序段  
    ;;  
  \*) //通配  
    exit 1  
    ;;  
esac  //结束  
## function
function fname(){  
    程序段  
    }  
__其中在函数体内$0表示函数名，$1,表示第一个参数，$2表示第二个参数，调用方式  fname $1 $2__  
## 循环
while [condition] //条件不成立时终止  
do  
    程序段  
done  
until [conditon]  //条件成立使终止  
do  
    程序段  
done  
for var in con1 con2 con3 ..  //第一次循环var=con1,第二次var=con2, (seq 1 100) 从1到100连续  
do  
    程序段  
done  
