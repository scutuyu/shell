##### 参考链接：http://blog.csdn.net/fight_angel/article/details/43488151

#### 生成多层次，多维度的目录树

> __mkdir -p a/{b,c,d}/java == mkdir -p a/b/java a/c/java a/d/java__

    本例会生成一个a文件夹，a有3个文件件，b,c,d,而b,c,d分别有一个文件夹java，示例如下：

    a
    ├── b
    │   └── java
    ├── c
    │   └── java
    └── d
        └── java
