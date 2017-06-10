# 终端编译.java文件和执行.class文件

### 没有包结构
<em>/Users/tuyu/Desktop/java/Hello.java</em>

```
public class Hello{
  public static void main(String[] args){
    System.out.println("Hello World");
  }
}
```
> 1. 进入/Users/tuyu/Desktop/java目录
> 2. javac Hello.java
> 3. java Hello

    Hello World

### 有包结构

<em>/Users/tuyu/Desktop/java/com/tuyu/Hello.java</em>

```
package com.tuyu;

public class Hello{
  public static void main(String[] args){
    System.out.println("Hello World");
  }
}
```
> 1. 进入/Users/tuyu/Desktop/java目录
> 2. javac com/tuyu/Hello.java
> 3. java com.tuyu.Hello

    Hello World
