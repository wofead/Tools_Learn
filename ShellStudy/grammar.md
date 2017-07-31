# 这是一片关于学习shell语法的文档

## 常用的函数调用
1. read [-pt] variable  从键盘读取内容赋值给变量
参数：
-p : 提示内容
-t : 限制输入时间
example：
read -p "Please input your name: " -t 30 named
2. declare [-aixr] variable 
参数
-a : 数组
× 数组的声明
× declare -a var=(var1 var2 var3)
-i : int
-x : equal export 将变量变成环境变量
-r : readonly
example:
declare -i sum= 10+20+30
declare -x sum   =>增加sum的属性为全局变量
declare -r sum   =>增加sum的属性为只读变量
declare +x sum   =>减少sum的全局变量属性
export | grep sum   =>从全局变量中抓取sum
declare -p 打印sum的属性
3. 变量的修改

|变量的设置方式|说明|
|--------------|------------|
|${变量#关键字}|若变量内容从头开始的数据符合“关键字”，则将符合的最短数据删除|
|${变量##关键字}|若变量内容从头开始的数据符合“关键字”，则将符合的最长数据删除|
|${变量%关键字}|若变量内容从尾开始的数据符合“关键字”，则将符合的最短数据删除|
|${变量%%关键字}|若变量内容从尾开始的数据符合“关键字”，则将符合的最长数据删除|
|${变量/旧字符串/新字符串}|若变量内容符合“旧字符串”，则将第一个的旧字符串换成新字符串|
|${变量//旧字符串/新字符串}|若变量内容符合“旧字符串”，则将全部的旧字符串换成新字符串|
4. 变量的设置方式

|变量的设置方式|str没有设置|str为空字符串|str已经设置为非空字符串|
|--------------|------------|-----------|----------|
|var=${str-expr}|var=expr|var=|var=$str|
|var=${str:-expr}|var=expr|var=expr|var=$str|
|var=${str+expr}|var=|var=expr|var=expr|
|var=${str:+expr}|var=|var=|var=expr|
|var=${str=expr}|str=expr;var=expr|str不变;var=|str不变;var=$str|
|var=${str:=expr}|str=expr;var=expr|str=expr;var=expr|str不变;var=$str|
|var=${str?expr}|expr输出到stderr|var=|var=str|
|var=${str:?expr}|expr输出到sstderr|expr输出到srderr|var=str|
5. history
参数:
n : 数字，打印最近的n条数据
-c :将目前shell中的所有history内容全部删除
-a :将目前新增的history命令新增如histfiles中，如没有histfiles，则默认写入～/.bash_history
-r :将histfiles的内容读入到目前这个shell的history记忆中
-w :将目前的history记忆内容写入到histfiles中
××怎么利用history××
!number 执行第几条命令
!command 有最近的命令向前搜寻命令串开头为command的那个命令，并执行
!! 执行上一条命令
## 通配符与特殊符号

|符号|意义|
|----|-----|
|×|代表0至多个符号|
|?|代表一个任意符号|
|[]|代表一定含有括号中的一个符号|
|[^]|代表一定不含有括号中的一个符号|

## 数据流重定向
1. 标准输入（stdin）：代码为0,使用< 或者 <<
2. 标准输出（stdout）：代码为1,使用> 或者 >>
3. 标准错误输出（stderr）：代码为2,使用2> 或者 2>>
4. &> 1和2一起输出，即stdout和stderr
example:
find /home -name .bashrc > list_right 2> list_error     //其中>这个是若文件不存在，则创建并写入;若文件存在则清空再写如，若想累加写入，使用×>>×
输入example:
cat > catfile 
testing 
cat file test
[ctrl]+d  //相当于输入eof结束 
此时就会存在canfile文件和其中输入的内容
也可以通过重定向输入来读取文件内容，like：
cat > catfile < ~/.bashrc   //通过讲述如重定向到文件来输入
在输入重定向中 << "string" 代表键入string后结束，而不需要[ctrl]+d
cat > file << "eof" 当输入eof使结束输入过程
## 命令的同步执行
可以使用&&和||的实现命令的执行控制
forexample：
command1 && command2 || command3   //先判断命令1,命令1正确命令2,命令1不正确退出，命令2正确退出，不正确命令3
## 管道命令“|”
它会处理来自stdin的数据
### 选取命令： cut,grep
cut参数
-d : 后面跟分隔符，例如在PATH中“:”是分隔符，一般和 -f连用，后面接范围，如2,4,即输出2,4的元素，开头为1
-f : 取元素的范围
-c : 按行切割元素进行输出， 12-15 即输出第12到15符号，12- 即输出12到最后的符号

grep参数
-a : 将binary文件以txt文件的方式查找数据
-c : 计算找到“查找字符串”的次数
-i : 忽略大小写
-n : 顺便输出行好
-v : 反响选择
--color=auto : 将查找出来的数据中的关键字加上颜色
### 排序命令sort,wc,uniq
sort参数：
-f : 忽略大小写
-b : 忽略最前面的空格
-M : 以月名
-n : 使用数字，默认为字符
-r : 反向排序
-u : uniq
-t : 分隔符，默认[Tab]
-k : 以那个区间进行排序
uniq参数：
-i : 忽略大小写
-c : 计数
wc参数：
-l : 多少行
-w : 多少个单词
-m : 多少个字符

### 双重定向
tee:
example:
last | tee last.file | cut -d " " -f1
### 字符转换命令:tr,col,join,paste,expand
tr参数：
-d : 删除信息当中的字符串   example: cat /etc/passwd | tr -d ':'
-s : 替换掉重复的字符   last | tr '[a-z]' '[A-Z]'

col参数：
-x : 将tab转换为空格
-b : 在文本内有反斜杠时，仅保留/最后接的那个字符
join参数：join [-ti12] file1 file2合并两个文件
-t : 以什么分割符号分开，默认空格
-i : 忽略大小写
-1 : 以第一个文件那个字段来分析
-2 : 以第二个文件的那个字段来分析  //类似与数据库的合并
paste [-d] file1 file2 
-d : 分隔符，默认[Tab]
expand [-t] file 将文件中的[Tab]用空格代替
-t : 将[Tab] 用几个空格代替
### 切割命令split
split [-bl] file PREFIX
参数:
-b : 后面可接欲切割成的文件的大小，列入b，l，等;
-l : 以行数来进行切割齐
PREFIX : 代表前导符，可作为切割文件的前导文字
example: cd /temp ; split -b 300k /etc/termcap termcap
### xargs 参数替换
用法：find /sbin -perm +7000 | xargs ls -l 就是对那些并不支持管道的命令引用standard input之用
### 关于减号 - 的用途
example: tar -cvf - /home | tar -zvf -
## 基本的正则表达式
grep -n '[^[:lower:]]oo' file //在文件中查找非小写，并且后面存在两个_o_的关键字
grep -n '[[:digit:]]' file //在文件中查找有数字存在的一行
grep -n '^the' file //行首是the的一行，注意这里的_^_的位置，和反有区别，一个在中括号里面，一个在外面
grep -n '\.$' file //查找尾部是_._的一行，其中_._是经过转义的
任意字符. 和 重复字符* 
其中.代表任意一个字符，*代表前一个字符的0个至多个
ls | grep '^a.*'   //查找以a开头的
^word:开头是word
word$:结尾是word
.:任意一个字符
*:重复上一个字符0到n
[list]:在list中
[n1-n2]:在n1到n2范围内
[^list]:不在list中
\{n,m\}:连续n个前面的字符，小于m
## sed 的使用
参数：
-n : 使用安静模式，一般来自stdin的数据会打印到屏幕上。
-e : 直接在命令行模式上进行sed的动作编辑
-f : 直接将sed的动作写在一个文件内，-f filename则可以执行filename内的sed动作
-r : sed的动作支持的是扩展型正则表达式的语法，（默认为基础）
-i : 直接修改读取的文件的内容
[n1][,n2] function  example: 10,20 function 动作在10到20 行执行
function 的参数
a : 另起一行插入，sed '2a drink tea' 如果插入多行，可以采用/>的方式
c : 替换 sed '2,5c No 2-5 number'
d : delete, sed '2,5d'
i : 在这一行的后面插入，sed '2i drink tea'
p : 打印，一般和 -n连用 sed -n '5,7p'
s : 替换， 1,20s/old/new/g
其中大部分可以采用s来实现
sed 's/^.*addr//g' 删除addr前面的内容
sed 's/^#.*$//g' 删除批注的内容
sed 's/^$/d' 删除空白行
sed -i '$a This is a test' file //sed可以对文件直接进行操作
## egrep可支持正则表达式的操作
egrep -v '^$|^#' file 出去空行和开头不是#
\+ 一个到多个前一个RE字符
\? 一个或0个前一个RE字符
| 或者 gd|go  意思是gd或者go都可以
() 组字符串 g(oo|la)d good|glad
()+ 一个或者多个组
## awk:好用的数据处理工具
相比与sed，awk通常把一行分成几个字段来处理
awk '条件类型1 {动作 1}条件类型 2 {动作 2}....' filename
常用变量名称：
NF : 每一行($0)拥有的字段总数
NR : 目前awk所处理的是第几行数据
FS : 目前的分隔符，默认为空格
example:
1. last -n 5 | awk '{print $1 "\t" $3}'   //利用空格对行进行分割，然后通过_$_符号来获取元素
2. last -n 5 | awk '{print $1 "\t lines: " NR "\t columes: " NF}'
3. cat /etc/passwd | awk '{FS=":"}$3 < 10 {print $1 "\t" $3}'
## 文件的比较diff，cmp，patch
diff [-bBi] from-file to file //指出两个版本的区别，有点想gitbash
from-file : 欲比较文件名
to-file : 目的比较文件名
-b : 忽略一行中仅有多个空白的区别
-B : 忽略空白行的区别
-i : 忽略大小写的不同

cmp [-s] file1 file2
-s : 举出所有的不同，默认指出第一个

patch更新和还原文件
## 文件打印准备pr
pr /etc/man.config
## 查找
locate [-ir] keyword
参数 : 
-i : 忽略大小写
-r : 后面可以带正则表达式  

whereis 寻找特定文件

file 查看文件的类型

touch 文件的创建
