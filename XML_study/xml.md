### xml ，html的补充，主要用来数据的处理
1. XML 文档必须包含根元素。该元素是所有其他元素的父元素。XML 文档中的元素形成了一棵文档树。这棵树从根部开始，并扩展到树的最底端。

        <root>
            <child>
                <subchild>.....</subchild>
            </child>
        </root>
        <bookstore>
            <book category="COOKING">
                <title lang="en">Everyday Italian</title> 
                <author>Giada De Laurentiis</author> 
                <year>2005</year> 
                <price>30.00</price> 
            </book>
            <book category="CHILDREN">
                <title lang="en">Harry Potter</title> 
                <author>J K. Rowling</author> 
                <year>2005</year> 
                <price>29.99</price> 
            </book>
            <book category="WEB">
                <title lang="en">Learning XML</title> 
                <author>Erik T. Ray</author> 
                <year>2003</year> 
                <price>39.95</price> 
            </book>
        </bookstore>
2. 所有 XML 元素都须有关闭标签
1. XML 标签对大小写敏感
1. XML 必须正确地嵌套
1. XML 文档必须有根元素
1. XML 的属性值须加引号

        <note date=08/08/2008>//error
        <to>George</to>
        <from>John</from>
        </note> 
        <note date="08/08/2008">//right
        <to>George</to>
        <from>John</from>
        </note> 
7. 实体引用

         <message>if salary < 1000 then</message>//有<是错误的
         <message>if salary &lt; 1000 then</message> 

|-|-|-|
|:--:|:--:|:--:|
|\&gt|>|大于|
|\&lt|<|小于|
|\&amp|&|和号|
|\&apos|'|单引号|
|\&qout|"|引号|
8. XML 中的注释

        <!-- This is a comment --> 
9. 在 XML 中，空格会被保留
1. XML 以 LF 存储换行
#### XML 文档包含 XML 元素

        <bookstore>
        <book category="CHILDREN">
        <title>Harry Potter</title> 
        <author>J K. Rowling</author> 
        <year>2005</year> 
        <price>29.99</price> 
        </book>
        <book category="WEB">
        <title>Learning XML</title> 
        <author>Erik T. Ray</author> 
        <year>2003</year> 
        <price>39.95</price> 
        </book>
        </bookstore> 
在上例中\<bookstore> 和\<book> 都拥有元素内容,因为它们包含了其他元素。\
\<author> 只有文本内容，因为它仅包含文本, \<book> 元素拥有属性 (category="CHILDREN").
1. XML 属性必须加引号

        <person sex="female">
        <person sex='female'>

        <gangster name='George "Shotgun" Ziegler'>
        <gangster name="George &quot;Shotgun&quot; Ziegler">\
2. 尽量避免属性

        <note>
        <date>
        <day>08</day>
        <month>08</month>
        <year>2008</year>
        </date>
        <to>George</to>
        <from>John</from>
        <heading>Reminder</heading>
        <body>Don't forget the meeting!</body>
        </note>
3. 针对元数据的 XML 属性，有时候会向元素分配 ID 引用。这些 ID 索引可用于标识 XML 元素，它起作用的方式与 HTML 中 ID 属性是一样的。上面的 ID 仅仅是一个标识符，用于标识不同的便签。它并不是便签数据的组成部分。在此我们极力向您传递的理念是：元数据（有关数据的数据）应当存储为属性，而数据本身应当存储为元素。

        <messages>
        <note id="501">
            <to>George</to>
            <from>John</from>
            <heading>Reminder</heading>
            <body>Don't forget the meeting!</body>
        </note>
        <note id="502">
            <to>John</to>
            <from>George</from>
            <heading>Re: Reminder</heading>
            <body>I will not</body>
        </note> 
        </messages>
#### 初始xml变量
1. 初始化

        var myXML:XML =  
        <order> 
            <item id='1'> 
                <menuName>burger</menuName> 
                <price>3.95</price> 
            </item> 
            <item id='2'> 
                <menuName>fries</menuName> 
                <price>1.45</price> 
            </item> 
        </order>

        var str:String = "<order><item id='1'><menuName>burger</menuName>" 
                            + "<price>3.95</price></item></order>"; 
        var myXML:XML = new XML(str);

        var tagname:String = "item";  
        var attributename:String = "id";  
        var attributevalue:String = "5";  
        var content:String = "Chicken";  
        var x:XML = <{tagname} {attributename}={attributevalue}>{content}</{tagname}>;  
        trace(x.toXMLString()) 
            // Output: <item id="5">Chicken</item>

        //导入xml文本
        import flash.events.Event; 
        import flash.net.URLLoader; 
        import flash.net.URLRequest; 
        
        var externalXML:XML; 
        var loader:URLLoader = new URLLoader(); 
        var request:URLRequest = new URLRequest("xmlFile.xml"); 
        loader.load(request); 
        loader.addEventListener(Event.COMPLETE, onComplete); 
        
        function onComplete(event:Event):void 
        { 
            var loader:URLLoader = event.target as URLLoader; 
            if (loader != null) 
            { 
                externalXML = new XML(loader.data); 
                trace(externalXML.toXMLString()); 
            } 
            else 
            { 
                trace("loader is not a URLLoader!"); 
            } 
        }
#### 组合和变换xml对象

        var x1:XML = <p>Line 1</p>  
        var x2:XML = <p>Line 2</p>  
        var x:XML = <body></body> 
        x = x.appendChild(x1);//后面添加元素
        x = x.appendChild(x2); 
        x = x.prependChild(<p>Line 0</p>);   //前面添加元素
            // x == <body><p>Line 0</p><p>Line 1</p><p>Line 2</p></body>
        //for语句来构造xml变量
        var ids:Array = [121, 122, 123];  
        var names:Array = [["Murphy","Pat"], ["Thibaut","Jean"], ["Smith","Vijay"]] 
        var x:XML = new XML("<employeeList></employeeList>"); 
        
        for (var i:int = 0; i < 3; i++) 
        { 
            var newnode:XML = new XML();  
            newnode = 
                <employee id={ids[i]}> 
                    <last>{names[i][0]}</last> 
                    <first>{names[i][1]}</first> 
                </employee>; 
        
            x = x.appendChild(newnode) 
        }

        var x:XML =  
        <employee> 
            <lastname>Smith</lastname> 
        </employee> 
        x.firstname = "Jean"; 
        x.@id = "239";
#### 访问属性
使用 @ 符号（属性标识符运算符）可以访问 XML 或 XMLList 对象的属性.

        ar employee:XML =  
            <employee id="6401" code="233"> 
                <lastName>Wu</lastName> 
                <firstName>Erin</firstName> 
            </employee>; 
        trace(employee.@id); // 6401

        var employee:XML =  
            <employee id="6401" code="233"> 
                <lastName>Wu</lastName> 
                <firstName>Erin</firstName> 
            </employee>; 
        trace(employee.@*.toXMLString());  
        // 6401 
        // 233

        var employee:XML =  
            <employee id="6401" code="233"> 
                <lastName>Wu</lastName> 
                <firstName>Erin</firstName> 
            </employee>; 
        trace(employee.attribute("id")); // 6401 
        trace(employee.attribute("*").toXMLString());  
        // 6401 
        // 233 
        trace(employee.attributes().toXMLString());  
        // 6401 
        // 233
#### 按属性或元素值过滤

        var x:XML =  
        <employeeList> 
            <employee id="347"> 
                <lastName>Zmed</lastName> 
                <firstName>Sue</firstName> 
                <position>Data analyst</position> 
            </employee> 
            <employee id="348"> 
                <lastName>McGee</lastName> 
                <firstName>Chuck</firstName> 
                <position>Jr. data analyst</position> 
            </employee> 
        </employeeList>
* x.employee.(lastName == "McGee") — 这是第二个 employee 节点。
* x.employee.(lastName == "McGee").firstName — 这是第二个 employee 节点的 firstName 属性。
* x.employee.(lastName == "McGee").@id — 这是第二个 employee 节点的 id 属性的值。
* x.employee.(@id == 347) — 第一个 employee 节点
* x.employee.(@id == 347).lastName — 这是第一个 employee 节点的 lastName 属性
* x.employee.(@id > 300) — 这是具有两个 employee 属性的 XMLList。
* x.employee.(position.toString().search("analyst") > -1) — 这是具有两个 position 属性的 XMLList。
**如果试图按照可能不存在的属性或元素过滤，则 Flash® Player 和 Adobe® AIR™ 将引发异常。**

        var doc:XML =  
                    <body> 
                        <p id='123'>Hello, <b>Bob</b>.</p> 
                        <p>Hello.</p> 
                    </body>; 
        trace(doc.p.(@id == '123'));
代码的最后一行产生一个错误，因为第二个 p 元素中没有 id 属性。


为了避免这些错误，可以使用 attribute() 和 elements() 方法来识别具有匹配属性或元素的属性，如下面的代码所示：

        var doc:XML =  
                    <body> 
                        <p id='123'>Hello, <b>Bob</b>.</p> 
                        <p>Hello.</p> 
                    </body>; 
        trace(doc.p.(attribute('id') == '123')); 
        trace(doc.p.(elements('b') == 'Bob'));
#### 使用 for..in 和 for each..in 语句

        var myXML:XML =  
        <order> 
            <item id='1' quantity='2'> 
                <menuName>burger</menuName> 
                <price>3.95</price> 
            </item> 
            <item id='2' quantity='2'> 
                <menuName>fries</menuName> 
                <price>1.45</price> 
            </item> 
        </order>;

        var total:Number = 0; 
        for (var pname:String in myXML.item) 
        { 
            total += myXML.item.@quantity[pname] * myXML.item.price[pname]; 
        }

        var total2:Number = 0; 
        for each (var prop:XML in myXML.item) 
        { 
            total2 += prop.@quantity * prop.price; 
        }
####将 XML 和 XMLList 对象转换为字符串

        var myXML:XML =  
            <order> 
                <item id='1' quantity='2'> 
                    <menuName>burger</menuName> 
                    <price>3.95</price> 
                </item> 
            <order>; 
        
        trace(myXML.item[0].menuName.toXMLString());  
            // <menuName>burger</menuName> 
        trace(myXML.item[0].menuName.toString()); 
            // burger
#### 将字符串转换为 XML 对象

        var x:XML = new XML("<a>test</a>");

        var myXML:XML =  
                        <order> 
                            <item> 
                                <price>3.95</price> 
                            </item> 
                            <item> 
                                <price>1.00</price> 
                            </item> 
                        </order>; 
 
        var total:XML = <total>0</total>; 
        myXML.appendChild(total); 
        
        for each (var item:XML in myXML.item) 
        { 
            myXML.total.children()[0] = Number(myXML.total.children()[0]) + Number(item.price.children()[0]); 
        } 
        trace(myXML.total); // 4.35;
####读取外部 XML 文档

        var myXML:XML = new XML(); 
        var XML_URL:String = "http://www.example.com/Sample3.xml"; 
        var myXMLURL:URLRequest = new URLRequest(XML_URL); 
        var myLoader:URLLoader = new URLLoader(myXMLURL); 
        myLoader.addEventListener("complete", xmlLoaded); 
        
        function xmlLoaded(event:Event):void 
        { 
            myXML = XML(myLoader.data); 
            trace("Data loaded."); 
        }