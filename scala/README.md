# scala学习笔记

#### call by name
> 默认是call by value,比如在调用func(3 + 3, 2)函数时，会先计算表达式3+3,再将值传入func()函数，
>
> 而使用call by name 就会在先进入func()函数，发现用到了第一个参数，这时才开始计算3+3表达式
>
> call by name 的声明方式是在参数列表中的类型前加上=>,例如
```
def func(x: => Int, y: Int) : Int = {
println("在func函数体内")
println("使用第一个参数x= " + x)//如果x传入的是表达式，这时才开始计算
}
```

#### 高阶函数
使用函数作为其他函数的参数，或者使用函数作为输出结果

```
def apply(f: Int => String, v: Int) = {
  f(v)
}

def layout[A](x: A) = "[" + x.toString + "]"

applay(layout, 111)
```

#### 偏应用函数
使用通配符_将原始函数的参数替代形成功能相同，但参数列表不一样的新函数

```
def sayHello(name: String, times: Int){
  println(name + " say hello to scala " + times.toString + " times")
}

val name = "tuyu"
//第一种方式
for (i <- 1 to 5){
  syaHello(name, i)
}
//第二种方式
val tuyuSayHello = sayHello(name, _: Int)
for (i <- 1 to 5) {
  tuyuSayHello(i)
}
```
> 第一种方式和第二种方式输出的结果一样
> ```
tuyu say hello to scala 1 times
tuyu say hello to scala 2 times
tuyu say hello to scala 3 times
tuyu say hello to scala 4 times
tuyu say hello to scala 5 times
> ```

#### 函数的柯里化（Currying）
```
//下面是一个柯里化函数
def add(x: Int)(y: Int) = x + y
//当调用add(1)(2)时，add(1) 返回的是一个匿名函数(y: Int) => 1 + y,为了得到结果，继续调用该匿名函数(2) => 1 + 2
```

#### 指定函数参数名
传参可以不按声明的顺序，前提是指定函数参数名

```
def apply(a: Int, b: Int) = {
  println("a = " + a)
  println("b = " + b)
}

apply(b=6, a=1)
```
> 输出如下：
>
> ```
scala> apply(b=6, a=1)
a = 1
b = 6
> ```

#### 可变参数
在参数列表中最后一个参数的类型后面写上*

```
def apply(args: String*) = {
  var i = 0
  for(arg <- args){
    println("arg[" + i "] = " + arg)
    i = i + 1
  }
}
apply("hello", "world", "hello", "scala")
```
> 输入如下：
>
> ```
scala> apply("hello", "world", "hello", "scala")
arg[0] = hello
arg[1] = world
arg[2] = hello
arg[3] = scala
> ```

#### 递归函数

```
def factorial(n: BigInt) : BigInt = {
  if (n <= 1)
    1
  else
    n * factorial(n - 1)
}

println("10的阶乘等于 " + factorial(10))
```
> 输出如下：
>
> ```
scala> println("10的阶乘等于 " + factorial(10))
10的阶乘等于 3628800
> ```

#### 函数嵌套
在Scala函数内定义函数，定义在函数内的函数称之为局部函数


#### 匿名函数
箭头左边是参数列表，右边是函数体

```
var add = (x: Int, y: Int) => {
  x + y
}

add(1,2)
```
> 匿名函数实际上等价于：
>
> ```
var add = new Function1[Int, Int, Int] {
  def apply(x: Int, y: Int): Int = x + y
}
> ```

#### 数组的定义方式
```
var z: Array[String] = new Array[String](3);
z[1] = "xxx"
....


var z = new Array[String](3)
z[1] = "xxx"
....

var z = Array("Runoob", "Baidu", "Google")
z[1] = "xxx"
....
```

#### 二维数组

```
var myMatrix = ofDim[Int](3,3)//3行3列，值为Int类型
```

#### 合并数组concat

```
var arr1 = Array(1,2,3)
var arr2 = Array(1,2,3)
var arr3 = Array.concat(arr1, arr2)
```

#### 区间数组

```
var arr1 = Array.range(1,10)//取1，不取10，间隔默认为1
var arr2 = Array.range(1,10,2)//取1，不取10，间隔为2
```
