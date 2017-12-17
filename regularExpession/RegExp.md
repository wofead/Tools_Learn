### as中正则表达式
1. 定义形式，

        var pattern:RegExp = /1\/2/;
        var pattern:RegExp = new pattern(/1\/2/);
        var pattern1:RegExp = new RegExp("eat at \"joe's\"", ""); //eat at "joe's"
        var pattern2:RegExp = new RegExp('eat at "joe\'s"', "");

        var pattern1:RegExp = /1\/2 "joe's"/; //1\2 "joe's"
        var pattern2:RegExp = new RegExp("1/2 \"joe's\"", ""); 
        var pattern3:RegExp = new RegExp('1/2 "joe\'s"', '');

        str.match(re)
2. 需要结合match()函数来实现正则表达式的正确执行
### 字符类
1. 用方括号（[ 和 ]）定义字符类，即在小括号和中括号里面的内容称为字符类
**通常在正则表达式中具有特殊含义的大多数元字符和元序列在字符类中“不具有”那些特殊含义。例如，在正则表达式中星号用于表示重复，但是出现在字符类中时则不具有此含义。**

        /[abc*123]/  表示匹配*abc123中的任意一个字符
        ^符号只有在字符类的开头才表示反转，其他时候表示匹配开头

|:--:|:--:|
|元字符|在字符类中的含义|
|]|定义字符类的结尾|
|-|定义字符类的范围|
|\|定义元序列并撤销元字符的特殊含义。|

        /[$\\\]\-]/  //表示$,\,],-中的任意一个
2. 除了上述的还有换行，回车，制表，\unnn匹配具有制定Unicode代码点值（由十六进制数字 nnnn 定义）的字符，\\xnn，匹配具有指定ASCII值（由十六进制数字 nn 定义）的字符。

        /[a-z0-9]/  //表示范围
        /[^a-z0-9]/  //放在开头表示翻转
        /[!.,#+*%$&^]/  //结尾表示一个普通的字符
        /[abc]+/ 匹配重复的一个或多个字符，这些字符可能是 a、b 或 c 中的某个。
        /(very, )*/ 匹配重复零次或多次的后跟逗号和空格的单词 very。
3. 默认情况下，正则表达式执行所谓的“无限匹配”。正则表达式中的任何子模式（如 .*）都会尝试在字符串中匹配尽可能多的字符，然后再执行正则表达式的下一部分。
4. 可以使用replace()函数来替换匹配到的字符串

        var pattern:RegExp = /Hi, (\w+)\./; 
        var str:String = "Hi, Bob."; 
        trace(str.replace(pattern, "$1, hello.")); 
          // output: Bob, hello.

### 标志和属性

|:--:|:--:|:--:|
|标志|属性|描述|
|g|global|匹配多个匹配|
|i|ignoreCase|不区分大小写|
|m|multiline|设置此标志后，$ 和 ^ 可以分别匹配行的开头和结尾，即每行都会匹配，否则只会匹配一行|
|s|dotall|设置此标志后，.（点）可以匹配换行符 (\n)。否则“.”不匹配换行符|
|x|extended|允许扩展的正则表达式。您可以在正则表达式中键入空格，它将作为模式的一部分被忽略。这可使您更加清晰可读地键入正则表达式代码。|

### 数组
#### Array
1. var names:Array = ["John", "Jane", "David"];
2. var names:Array = new Array(3);
3. var names:Array = new Array("John", "Jane", "David"); 
4. var names:Array = ["John", "Jane", "David"];
#### Vector.<Type>
1. var v:Vector.<String>; 
2. v = new Vector.<String>();
3. var names:Vector.<String> = new Vector.<String>(); 
4. var numbers:Vector.<int> = Vector.<int>("1.5", "17", "Waffles"]); 
####检索值和删除数组元素
1. pop(),删除数组末尾的元素
2. shift()，删除数组头部的元素
3. slice()，参数不定，第一个参数为从数组下标几开始替换，第二个参数为替换几个，后面的参数为替换的值
4. delete(),删除数组元素的值，那个值被删除后变成undefined
5. 可以通过控制数组的长度来删除数组后面的元素

