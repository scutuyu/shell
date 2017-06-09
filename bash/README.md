echo -n "helo" 将会阻止产生新行

### 简单循环

```
#!/bin/bash
var0=0  #赋值语句，等号=前后都不要有空格，不然会报错
LIMIT=5 #赋值语句，等号=前后都不要有空格，不然会报错
while [ "$var0" -lt "$LIMIT" ] #中括号内要有空格
do
  echo "$var0"
  #var0=`expr $var0 + 1` #赋值语句，等号=前后都不要有空格，不然会报错
  #var0=$(($var0 + 1))
  #var0=$((var0 + 1))
  #let "var0 += 1"
  ((var0 += 1))
done
echo
exit 0
```

### 循环读取控制台输入，end退出

```
#!/bin/bash
#while [ "$var1" != "end" ]
while test "$var1" != "end"
do
  echo "Input variable #1 (end to exit)"
  read var1
  echo
done
exit 0
```

### 简单循环 C语言语法

```
#!/bin/bash
((a = 1))
((LIMIT = 5))
while ((a <= LIMIT))
do
  echo "$a"
  ((a += 1))
done
echo
exit 0
```

### until 与 while逻辑相反，false才执行do
```
#!/bin/bash
until [ "$var1" = "end" ]
do
  echo "Input variable #1(end to exit)"
  read var1
  echo "variable #1 = $var1"
  echo
done
exit 0
```
