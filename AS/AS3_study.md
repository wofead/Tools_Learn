# AS study
### 变量和常量
变量使用var，常量使用const
### 数据的类型
* string
* Numeric
    * number：任何数值
    * int
    * Uint 无符号
* boolean
* MovieClip ： 影片剪辑原件
* TextField ： 动态文本字段或者输入文本字段
* SimpleButton ： 按钮元件
* Date ： 时间与日期
## 处理对象
### 属性
 表示某个对象中绑定在一起的若干数据块中的一个，可以通过“.”来访问对象的属性
### 方法
可以由对象执行的操作，可以通过“.”来调用对象的方法
### 事件
1. 基事件的处理
    * 事件源 ： 发生该事件的是哪个对象
    * 事件 ： 将要发生什么事情
    * 响应 ： 当事件发生时，你希望执行哪些步骤
    *** 
    * 一般包含两个函数，一个是执行函数，另一个是监听函数

            function eventResponse(event:MouseEvent):void 
            {    //事件反应函数
                // Actions performed in response to the event go here. 
            } 
            myButton.addEventListener(MouseEvent.CLICK, eventResponse);//事件监听函数
2. 了解实事件的处理过程
3. 事件处理的例子
### 创建对象实例
在使用对象之前，先要创建对象，对象的创建，分为以下几种
1. 文本数字值（直接输入数字）：

        var someNumber:Number = 17.239; 
        var someNegativeInteger:int = -53; 
        var someUint:uint = 22;
2. 文本字符串值（用双引号将本文引起来）：

        var firstName:String = "George"; 
        var soliloquy:String = "To be or not to be, that is the question...";
3. 文本布尔值（使用字面值 true 或 false）：

        var niceWeather:Boolean = true; 
        var playingOutside:Boolean = false;
4. 文本数组值（在方括号中包含以逗号分隔的值列表）： attention ： **和其他语言有一定的区别**

        var seasons:Array = ["spring", "summer", "autumn", "winter"];
5. 文本 XML 值（直接输入 XML）：

        var employee:XML = <employee> 
        <firstName>Harold</firstName> 
        <lastName>Webster</lastName> 
        </employee>;
### 创建自己的类
* 类设计的策略
    1. 实例将在应用程序中扮演的角色
        * 值对象
        * 显示对象
        * 应用c程序的对象
    2. 确定类所需要的特定功能
    3. 如果打算将类用作值对象，请确定实例将包含的数据
    4. 由于类是专门为项目而设计的，因此最重要的是提供应用程序所需的功能。
        * 应用程序将存储、跟踪和处理哪些信息？确定这些信息有助于您识别可能需要的值对象和属性。
        * 需要执行的哪些操作
        * 对于任何给定的动作，要执行该动作，该类需要了解哪些信息？这些信息将成为方法的参数。
        * 随着应用程序开始工作，应用程序的其它部分需要了解类中的哪些内容将发生更改？这些是很好的候选事件。
    5. 如果有一个现有的对象类似于您需要的对象，只是缺少您想要添加的一些额外功能，请考虑创建一个子类（在现有类的功能的基础之上构建的类，而不是定义该类自己的所有功能）。
## ActionScript的语言及其语法
### 对象与类
* 所有的类都是从object类派生的,其中在无类型变量可以保存特殊值 undefined
*  声明类的属性
    1. const ： 声明常量
    2. var ： 定义变量
    3. 用 get 和 set 属性 (attribute) 定义 getter 和 setter 属性 (property)
    4. function 关键字来声明方法
    **可以使用new运算符来创建类的实例**
### 包和命名空间
_包和命名空间是两个相关的概念。使用包，可以通过有利于共享代码并尽可能减少命名冲突的方式将多个类定义捆绑在一起。使用命名空间，可以控制标识符（如属性名和方法名）的可见性。无论命名空间位于包的内部还是外部，都可以应用于代码。包可用于组织类文件，命名空间可用于管理各个属性和方法的可见性。_
#### 包
* 包里面命名的class默认说明符internal，包成员仅对其所在包的其它成员可见，要想其它的包成员能够看到，说明符应该命名为public
####命名空间
_通过命名空间可以控制所创建的属性和方法的可见性。请将 public、private、protected 和 internal 访问控制说明符视为内置的命名空间。如果这些预定义的访问控制说明符无法满足您的要求，您可以创建自己的命名空间。_
* 命名空间的使用
    1. 必须使用 namespace 关键字来定义命名空间
        
        namespace version1;
    2. 在属性或方法声明中，使用命名空间（而非访问控制说明符）来应用命名空间。

        version1 function myFunction() {}
    3. 在应用了该命名空间后，可以使用 use 指令进行引用，也可以使用一个命名空间来限定标识符的名称。您还可以使用限定名称引用 myFunction() 函数
        1.
        use namespace version1; 
        myFunction();
        2.
        version1::myFunction();
    4. 可以放在命名空间中的定义包括函数、变量和常量（不能将类放在自定义命名空间中）。
* 定义命名空间
    * 缺省URL的命名空间,则编译器将创建一个唯一的内部标识字符串来代替 URI。您对于这个内部标识字符串不具有访问权限。
    * 如果在包内定义命名空间，如果不声明为public，则其它包无法访问这个命名空间
* 应用命名空间

        namespace example1; 
        class someClass 
        { 
            example1 myFunction() {} 
        }
* 引用命名空间

        use namespace example1; 
        myFunction();
        or
        example1::myFunction();
### 变量
* 数组 

        var numArray:Array = ["zero","one","two"];
* 类的实例

        var customItem:CustomClass = new CustomClass();
* 多个变量的声明

        var num1:int,num2:int,num3:int;
### 了解变量的作用域
1. as中没有区域块的局部变量，只要局部变量限制在这个函数体内，由于没有区域块的限定，as还可以先对变量赋值使用再声明。
2. 默认值

|数据类型  | 默认值|  
|:---:|:---:|
|Boolean   |false   |
|int   |0   |
|Number   |NaN   |
|Object   |null   |
|String   |null   |
|uint   |0   |
|未声明（与类型注释 * 等效）   |undefined   |
|其它所有类（包括用户定义的类）   |null   |
### 数据类型
1. is运算符 ： is 运算符检查继承层次结构,返回true or false
2. as运算符 :  来检查表达式是否为给定数据类型的成员，返回表达式的值
### 动态类
1. 可以动态的往类中添加属性

        dynamic class Protean 
        { 
            private var privateGreeting:String = "hi"; 
            public var publicGreeting:String = "hello"; 
            function Protean() 
            { 
                trace("Protean instance created"); 
            } 
        }

        var myProtean:Protean = new Protean(); 
        myProtean.aString = "testing"; 
        myProtean.aNumber = 3; 
        trace(myProtean.aString, myProtean.aNumber); // testing 3
### 类型转换
* date的类型装换

        var myDate:Date = new Date(2005,6,1); 
        trace(String(myDate)); // Fri Jul 1 00:00:00 GMT-0700 2005
##as的语法
1. 区分大小写
2. 点语法 -> 运算符 (.) 提供对对象的属性和方法的访问。
3. 字面值
### 循环 
#### for ... in
for..in 循环访问对象属性或数组元素。

        var myObj:Object = {x:20, y:30}; 
        for (var i:String in myObj) 
        { 
            trace(i + ": " + myObj[i]); 
        } 
        // output: 
        // x: 20 
        // y: 30
#### for each... in
for each..in 循环用于循环访问集合中的项，这些项可以是 XML 或 XMLList 对象中的标签、对象属性保存的值或数组元素。

        var myObj:Object = {x:20, y:30}; 
        for (var i:String in myObj) 
        { 
            trace(i + ": " + myObj[i]); 
        } 
        // output: 
        // x: 20 
        // y: 30
### 函数的定义以及参数

        function passPrimitives(xParam:int, yParam:int):void 
        { 
            xParam++; 
            yParam++; 
            trace(xParam, yParam); 
        } 
* 可以设置默认值

        function defaultValues(x:int, y:int = 3, z:int = 5):void 
        { 
            trace(x, y, z); 
        } 
        defaultValues(1); // 1 3 5
 * arguments 对象
    * arguments 对象是一个数组，其中包括传递给函数的所有参数。
    * arguments.length 属性报告传递给函数的参数数量。
    * arguments.callee 属性提供对函数本身的引用，该引用可用于递归调用函数表达式。
* ... (rest) 参数
    * 此参数可用来指定一个数组参数以接受任意多个以逗号分隔的参数。
## 面向对象的编程
### 类
* 类的定义

        // ActionScript 3.0 
        package flash.display 
        { 
            public class BitmapData {} 
        }
* 类的修饰

| 属性|定义 |
|:--:|:--:|
|dynamic|允许在运行时向实例添加属性。|
|final|	不得由其它类扩展。|
|internal（默认）|对当前包内的引用可见。|
|public|对所有位置的引用可见。|
|private|对同一类中的引用可见。|
|protected|对同一类及派生类中的引用可见。|
|static|指定某一属性属于该类，而不属于该类的实例。|
|UserDefinedNamespace|用户定义的自定义命名空间名。|

* 类体
    * 类体放在大括号内，用于定义类的变量、常量和方法。

            public final class Accessibility 
            { 
                public static function get active():Boolean; 
                public static function updateProperties():void; 
            }
* 变量
    * 静态变量：静态变量是使用 static 关键字和 var 或 const 语句共同声明的。静态变量附加到类而不是类的实例，对于存储和共享应用于对象的整个类的信息非常有用。

            class StaticVars 
            { 
                public static var totalCount:int = 0; 
                public static const MAX_NUM:uint = 16; 
            }
* 构造函数的方法
    1. 函数语句：public function sampleFunction():String {}
    2. 函数表达式的变量：public var sampleFunction:Function = function () {}
    __多数情况下使用函数语句__
    3. 构造函数方法有时简单称为构造函数，是与在其中定义函数的类共享同一名称的函数。

            class ExampleEx extends Example 
            { 
                public function ExampleEx() 
                { 
                    trace(super.status); 
                    super(); 
                } 
            } 
            
            var mySample:ExampleEx = new ExampleEx(); // output: null
* get 和 set 存取器方法
    * 可以对从超类继承的 getter 和 setter 函数使用 override 属性。
            
            var myGetSet:GetSet = new GetSet(); 
            trace(myGetSet.publicAccess); // output: null 
            myGetSet.publicAccess = "hello"; 
            trace(myGetSet.publicAccess); // output: hello
### 接口
* 接口的定义和扩展

        //定义
        public interface IExternalizable 
        { 
            function writeExternal(output:IDataOutput):void; 
            function readExternal(input:IDataInput):void; 
        }
        //扩展
        public interface IExternalizable 
        { 
            function writeExternal(output:IDataOutput):void; 
            function readExternal(input:IDataInput):void; 
        }
* 在类中实现接口


        interface IAlpha 
        { 
            function foo(str:String):String; 
        } 
        
        interface IBeta 
        { 
            function bar():void; 
        } 
        
        class Alpha implements IAlpha, IBeta 
        { 
            public function foo(param:String):String {} 
            public function bar():void {} 
        }
**注意事项**
1. 使用 public 访问控制标识符。
2. 使用与接口方法相同的名称。
3. 拥有相同数量的参数，每一个参数的数据类型都要与接口方法参数的数据类型相匹配。
4. 使用相同的返回类型

### 继承
**静态成员是不能被继承的，他是和类绑定在在一起的，不会绑定在实例化的对象上面的**

        package 
        { 
            import flash.display.MovieClip; 
            public class StaticExample extends MovieClip 
            { 
                public function StaticExample() 
                { 
                    var myExt:Extender = new Extender(); 
                    trace(myExt.test);// output: instance 
                    trace(Base.test);// output: static
                } 
            } 
        } 
        
        class Base 
        { 
            public static var test:String = "static"; 
            public var test:String = "instance"; 
        } 
        
        class Extender extends Base {}
**静态属性的类体及该类的任何子类中可直接访问静态属性,如果使用与同类或超类中的静态属性相同的名称定义实例属性，则实例属性在作用域链中的优先级比较高**

        package 
        { 
            import flash.display.MovieClip; 
            public class StaticExample extends MovieClip 
            { 
                public function StaticExample() 
                { 
                    var myExt:Extender = new Extender(); 
                } 
            } 
        } 
        
        class Base { 
            public static var test:String = "static"; 
        } 
        
        class Extender extends Base 
        { 
            public function Extender() 
            { 
                trace(test); // output: static 
            } 
            
        }
**变量是不可以被覆盖的，唯一可覆盖的属性类型是方法，即使用 function 关键字声明的属性**

#### 覆盖的注意事项
1. 静态方法不能继承，也不能覆盖
2. 实例方法可由子类继承，也可覆盖，只要符合以下两个条件
    1. 实例方法在基类中不是使用 final 关键字声明的。
    2. 实例方法在基类中不是使用 private 访问控制说明符声明的

**覆盖时要注意的事项**
1. 覆盖方法必须与基类方法具有相同级别的访问控制
2. 覆盖方法必须与基类方法具有相同的参数数
3. 覆盖方法参数必须与基类方法参数具有相同的数据类型注释
4. 覆盖方法必须与基类方法具有相同的返回类型

#### super语句
当基类中的方法被直接覆盖时，子类可以通过super语句调用基类的被覆盖的函数
        
        package { 
        import flash.display.MovieClip; 
        public class SuperExample extends MovieClip 
        { 
            public function SuperExample() 
            { 
                var myExt:Extender = new Extender() 
                trace(myExt.thanks()); // output: Mahalo nui loa 
            } 
        } 
        } 

        class Base { //基类
            public function thanks():String 
            { 
                return "Mahalo"; 
            } 
        } 

        class Extender extends Base 
        { //子类
            override public function thanks():String 
            { 
                return super.thanks() + " nui loa"; //可以通过super调用基类的方法
            } 
        }
#### 覆盖getter和setter

        class Login2 {
        private var __username:String;
        public function Login2(username:String) {
            this.__username = username;
        }
        public function get userName():String {
            return this.__username;
        }
        public function set userName(value:String):Void {
            this.__username = value;
        }
        }

        var user:Login2 = new Login2("RickyM");

        // 调用"获取"方法
        var userNameStr:String = user.userName;
        trace(userNameStr); // RickyM

        // 调用"设置"方法
        user.userName = "EnriqueI";
        trace(user.userName); // EnriqueI

如果将一个变量定义为 IGeometricShape 实例，您不必知道它实际是 Circle 类的实例还是 Square 类的实例，就可以调用它的 describe() 方法

            var myShape:IGeometricShape = new Circle(100); 
            trace(myShape.describe());
调用 myShape.describe() 时，它执行 Circle.describe() 方法，因为即使将变量定义为 IGeometricShape 接口的实例，Circle 也是它的基础类。

这个示例说明了运行时多态的原则：完全相同的方法调用会导致执行不同的代码，这取决于要调用了其方法的对象的类。

GeometricShapes 应用程序会使用设计模式的简化版本（叫做“工厂方法”）应用这种基于接口的多态原则。术语工厂方法 指的是一个函数，该函数返回一个对象，其基本数据类型或内容可能会因上下文而不同。

        package com.example.programmingas3.geometricshapes  
        { 
            public class GeometricShapeFactory  
            { 
                public static var currentShape:IGeometricShape; 
        
                public static function createShape(shapeName:String, len:Number):IGeometricShape 
                { 
                    switch (shapeName) 
                    { 
                        case "Triangle": 
                            return new EquilateralTriangle(len); 
        
                        case "Square": 
                            return new Square(len); 
        
                        case "Circle": 
                            return new Circle(len); 
                    } 
                    return null; 
                } 
            
                public static function describeShape(shapeType:String, shapeSize:Number):String 
                { 
                    GeometricShapeFactory.currentShape =  GeometricShapeFactory.createShape(shapeType, shapeSize); 
                    return GeometricShapeFactory.currentShape.describe(); 
                } 
            } 
        }

###处理日期与时间的基础知识
#### Date
Date时间类，直接new Date();是获取当前的时间。
#### timer
处理计时函数的首选方式是使用 Timer 类

        package  
        { 
            import flash.display.Sprite; 
            import flash.events.TimerEvent; 
            import flash.utils.Timer; 
        
            public class ShortTimer extends Sprite 
            { 
                public function ShortTimer()  
                { 
                    // creates a new five-second Timer 
                    var minuteTimer:Timer = new Timer(1000, 5); 
                    
                    // designates listeners for the interval and completion events 
                    minuteTimer.addEventListener(TimerEvent.TIMER, onTick); 
                    minuteTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete); 
                    
                    // starts the timer ticking 
                    minuteTimer.start(); 
                } 
        
                public function onTick(event:TimerEvent):void  
                { 
                    // displays the tick count so far 
                    // The target of this event is the Timer instance itself. 
                    trace("tick " + event.target.currentCount); 
                } 
        
                public function onTimerComplete(event:TimerEvent):void 
                { 
                    trace("Time's Up!"); 
                } 
            } 
        }
        //持续五秒
        tick 1 
        tick 2 
        tick 3 
        tick 4 
        tick 5 
        Time's Up!

### String 
1. length：可以通过length属性来获取string的长度
2. 可以利用contact来连接字符串
3. 截取字符串，substr() and sunstring(); 他们都有两个参数，一个是从第几位开始，输出多少位，一个是从第几位到第几位
4. slice(),参数可以为负，这样倒着切割
