# chmod

1. 默认情况下hello.txt文件的属性是
-rw-r--r--

2. 执行chmod +x hello.txt后
-rwxr-xr-x
即所有用户(文件属主，同组用户，其他用户)都增加了执行权限
等同于chmod a+x hello.txt

3. 执行chmod u+x hello.txt后
-rwxr--r--
即文件属主增加执行权限

4. 执行chmod g+x hello.txt后
-rwxr-xr--
即同组用户增加执行权限

5. 执行chmod o+x hello.txt后
-rwxr-xr-x
即其他用户新增执行权限

6. 执行chmod -x hello.txt后
-rw-r--r--
即所有用户(文件属主，同组用户，其他用户)取消执行权限

7. 除了+x和-x之外，还有+r增加读权限，-r取消读权限，+w增加写权限，-w取消写权限
