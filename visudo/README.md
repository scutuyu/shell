#### 1. 让用户能够进行sudo切换
在root用户下输入：

> __visudo__

并在该文件中输入：

```
## Allow root to run any commands anywhere
root    ALL=(ALL)       ALL
tuyu    ALL=(ALL)       ALL
```
is not in the sudoers file
