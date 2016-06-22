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
		#判断expect软件包是否存在,如果不存在,我们就安装
		ubuntusearchresult=$(which expect |grep "no expect in")
		if [[ "$ubuntusearchresult" != "" ]]
		then
		echo "expect软件不存在,我们需要安装"
		sudo dpkg -i expect_5.45-5ubuntu1_amd64.deb
		else
		echo "expect软件存在"
		fi
	else
		#centos的安装包与ubuntu的安装包是不一样的
		#判断expect软件包是否存在,如果不存在,我们就安装
		centossearchresult=$(which expect |grep "no expect in")
		if [[ "$centossearchresult" != "" ]]
		then
		echo "expect软件不存在,我们需要安装"
		rpm -ivh tcl-8.5.7-6.el6.x86_64.rpm
		rpm -ivh expect-5.44.1.15-5.el6_4.x86_64.rpm
		else
		echo "expect软件存在"
		fi

	fi
else
echo "此操作系统不适用本脚本!"
fi

