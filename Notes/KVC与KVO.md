在关于设置和修改对象的属性，之前介绍了setter、getter的方法，也通过简化的点语法来进行设置和修改。然而Objective - C还支持以一种更为灵活的操作方式，这种方式以字符串形式间接操作对象的属性，即为Key Value Coding（简称KVC），译为键值编码。

<br>
##简单的KVC
<br>

最基本的KVC由NSKeyvaluecoding协议提供支持，最基本的操作属性如下：

- setValue：属性值 forKey：属性名 （为指定属性设置值）

- valueForKey：属性名 （获取指定属性的值）

比如KJUser类：
	
	@property (nonatomic, copy) NSString* name;
	@property (nonatomic, copy) NSString* time;

下面使用KVC来设置该对象的属性，以及访问该对象的属性：

	KJUser* user = [[KJUser alloc] init];
	
	//使用KVC方式设置属性
	[user setValue:@"KNIGHTJOKER" forKey:"name"];
	[user setValue:[[NSDate alloc] init] forKey:"time"];
	
	//使用KVC获取对象的属性
	NSLog(@"user的name为：%@",[user valueForKey:@"name"]);
	NSLog(@"user的time为：%@",[user valueForKey:@"time"]);

在KVC编程方式中，无论调用setValue：forKey方法，还是调用valueForKey：方法，都是通过NSString对象来指定被操作属性的，其中forKey：标签用于传入属性名。

对于setValue：属性值 forKey：@“name”（ valueForKey：@“name”）代码，底层的执行机制如下：

1. 程序优先考虑调用“setName：属性值”方法（同理优先调用getName方法）

2. 如果该类没有setName（getName）方法，KVC机制会搜索该类名为 _name 的成员变量，无论该成员变量是在什么地方定义，也无论它使用哪一个访问控制符修饰，这条KVC代码底层实际就是对 _name成员变量赋值（返回 _name成员变量的值）。

3. 如果该类既没有setName（getName）方法，也没有 _name 成员变量，那么KVC机制任然会继续搜索该类名为name的成员变量，同理无论该成员变量是在什么地方定义，也无论它使用哪一个访问控制符修饰，KVC代码底层也会对name成员变量赋值（返回name成员变量的值）。

4. 如果以上三条都没有找到，系统将会执行该对象的setValue：forUndefinedKey（valueforUndefinedKey）方法 （该方法就是引发一个异常，这个异常将会导致程序结束）

关于处理这个地方不存在的key，我们可以采取重写setValue：forUndefinedKey（valueforUndefinedKey）方法来进行处理。




