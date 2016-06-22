#!/bin/bash

#操作系统特征文件
etcissue="/etc/issue"
#操作系统特征文件
ubuntuissue="Ubuntu"
#判断当前执行脚本的宿主操作系统
if [ -f "$etcissue" ];then
#通过判断/etc/issue中是否包含ubuntu字符串来判断这是那一个操作系统
result=$(more $etcissue | grep "${ubuntuissue}")
#如果内容不为空,那么这就是Ubuntu操作系统了
	if [[ "$result" != ""  ]]
	then
	echo "Ubuntu"
	else
	echo "Centos"
	fi

else
echo "此操作系统不适用本脚本!"
fi

