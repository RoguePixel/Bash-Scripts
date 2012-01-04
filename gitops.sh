#!/bin/bash


echo -e "\
\n\
1: commit \n\
2:push to github\
\
"

read op

if [ $op == "1" ];then
	echo "type your commit journal statement"
	read com
	git commit -m "$com"

elif [ $op == "2" ];then
	git push origin master

else
	echo "\nincorrect statement or input\n"
fi
