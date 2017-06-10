# java RMI 远程方法调用
基于《Head First 设计模式》中的代理模式示例

### 实现接口Remote——java.rmi.Remote
> 1. 创建接口GumballMachineRemote,继承Remote,并声明多个个方法

```
package com.tuyu.rmi;
//省略了import语句
public interface GumballMachineRemote extends Remote{
  int getCount() throws RemoteException;

  String getLocation() throws RemoteException;

  State getState() throws RemoteException;
}
```
接口中返回了一个对象State，它是一个接口，需要实现Serializable接口
```
package com.tuyu.rmi;
//省略了import语句
public interface State extends Serializable{
  //省略声明的方法
}
```

### 继承UnicastRemoteObject,实现GumballMachineRemote

```
package com.tuyu.rmi;
//省略了import语句
public class GumballMachine extends UnicastRemoteObject implements GumballMachineRemote{

public GumballMachine throws RemoteException(){

}

public int getCount(){
  return 12;
}

public String getLocation(){
  return "hangzhou"
}

public State getState(){
  return new NoQuarterState(this);
}
}
```

上面的代码用到了类NoQuarterState,它实现了State接口，且NoQuarterState类中有GumballMachine属性，但是不需要将该属性序列化，因为，GumballMachine类没有实现Serializable接口，那么就要为NoQuarterState类中的属性GumballMachine前加上关键字transient

```
package com.tuyu.rmi;
//省略了import语句
public class NoQuarterState implements State{
  private transient GumballMachine gumballMachine;

  public NoQuarterState(GumballMachine gumballMachine){
    this.gumballMachine = gumballMachine;
  }
//其他代码
}
```
### 注册rmi服务

> 1. 编写Server.java,把实现了GumballMachineRemote的类注册到rmi注册表中

```
package com.tuyu.rmi;
//省略了import语句
public class Server{
  public static void main(String[] args){
    GumballMachine gumballMachine = null;
    try{
      gumballMachine = new GumballMachine();
      Naming.rebind("hangzhou/gumballMachine", gumballMachine);
    } catch (Exception e){
      e.printStackTrace();
    }
  }
}
```

到此服务端的rmi服务已经编写完毕了，需要编译.java文件，并通过rmic 编译生成客户端辅助类（Stub）和服务端辅助类（Skeleton）
> 1. javac com/tuyu/rmi/GumballMachine.java
> 2. javac com/tuyu/rmi/Server.java
> 3. rmic com.tuyu.rmi.GumballMachine
> 4. rmiregistry (&)
> 5. java com.tuyu.rmi.Server

解释一下:

```
1. 2. 都是编译.java文件，并生成相应的.class 文件
3. 使用rmic 将GumballMachine.class 文件编译生成GumballMachine_Stub.class
4. 开启rmi注册表，第4.步要在第5.之前
5. 将gumballMachine服务注册到rmi注册表
```
### 编写客户端，到服务端搜索指定服务，并调用方法

> 1. 编写Client.java 获取hangzhou/gumballMachine服务

```
package com.tuyu.rmi;
//省略了import语句
public class Client{
  public static void main(String[] args){
    GumballMachineRemote gumballMachineRemote = null;
    try{
      gumballMachineRemote = (GumballMachineRemote) Naming.lookup("rmi://127.0.0.1/hanghzou/gumballMachine");
      System.out.println("count = " + gumballMachineRemote.getCount());
      System.out.println("location = " + gumballMachineRemote.getLocation());
      System.out.println("state = " + gumballMachineRemote.getState());
    } catch(Exception e){
      e.printStackTrace();
    }
  }
}
```

> 2. 编译Client.java,并运行Client

```
1. javac com/tuyu/rmi/Client.java
2. java com.tuyu.rmi.Client
```

输出：

```
count = 15
location = hanghzou
state = state = com.tuyu.rmi.NoQuarterState@e9e54c2
```
