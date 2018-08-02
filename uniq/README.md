#### 1. 将重复行过滤掉

origin data
```
hello world
hello world
hello world
hello world
hello world
hello world
hello world
hello tuyu
hello tuyu
hello tuyu
hello tuyu
hi world
hi world
hi world
hi world
hi world
hi world
hi tuyu
hi tuyu
hi tuyu
hi tuyu
hi tuyu
hi tuyu
```
执行cat data.txt | uniq
输出：
```
hello world
hello tuyu
hi world
hi tuyu
```
