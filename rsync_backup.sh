#!/bin/sh

#with /bin/bash "\n" is ignored for some reason.
#for debugging uncomment "set -x"
#set -x

#RSYNC-BACKUP V1
#the script can be executed and by defualt the variables specified in the script will used, otherwise arguments may be passed to the script at runtime. This script can be used to sync remote files to a local directory or local files to a remote direcory specified at runtime.
##

#argument examples:
#":~$ rsync-backup.sh-raz user@host:/some/dir/ /some/dir"
#":~$ rsync-backup.sh user@host:/some/dir /local/dir
#":~$ rync-backup.sh /some/local/dir/ user@host:/some/dir/"

#States the PID of script
tput bold && tput setaf 2 && echo "\n $0 proc ID: $$ \n" && tput sgr0 

#GIVE TEXT COLOR:
#2 Green
#3 Yellow
#4 Blue
#5 Purple
#6 Cyan
#7 White
COL=
TXTCOL=$(tput setf 7) # Yellow
RESETCOL=$(tput sgr0) # Text reset
TXTBOLD=$(tput bold)


#not used currently. Could be used in the variables to date backups.
TIMESTAMPS=$(date +%T_%F) #displays with seconds 01:31:39_2011-12-22
TIMESTAMP=$(date +%R_%F) #displays 24 hour mode	 01:33_2011-12-22

#Modify as needed# 
USR=user
HOST="user@server"
HDIR="/some/remote/dir/"
SOURCEDIR="/some/dir"
SSHOPTS="ssh"
OPTS="\
-\
r\
a\
v\
z\
u\
i \
-e $SSHOPTS \
--progress \
"

if [ -z $1 ];then
echo "\n running with vars in '$0' \n"
echo "rsync $OPTS $SOURCEDIR $HOST:$HDIR"
rsync $OPTS $SOURCEDIR $HOST:$HDIR
else
	#tests if rsync flags are used as first arg
 	if [ ! -z $(echo $1 | grep -) ];then 
	$1
	echo " \n specified flags"	
		#testing whether string is empty
		if [ -z $2 ];then
		echo " \n must specify second input"		 
		#testing if host is specifed as second arg. If so, then files are copied from remote destination to local dir
		elif [ ! -z $(echo $2 | grep @) ];then
		echo "host specified as second arg"
			#checks if string is empty 
			if [ -z $3 ];then
			echo "no destination dir!"
			else  
			#echo "args:rsync $1 $2 $3"
			rsync $@			
			fi
		elif [ ! -z $(echo $2 | grep /) ];then  	
		echo "dir specified as second arg"

			if [ -z $3 ];then
			echo "no host specified!"
			else  
			echo "args:rsync $@"
			rsync $@
			fi
		fi
	#rsync 
	elif [ ! -z "$(echo $1 | grep @)" ];then
	echo "host specified as first input"
	echo "copy files to remote host without flags"		
		if [ -z $2 ];then
		echo "\n no destination dir!"
		else  
		echo "args:rsync $1 $2"
		rsync $@
		fi
	else 
	echo "dir specified as first input"
	echo "copy files from local dir to remote host"		
		if [ -z "$2" ];then
		echo "\n no host specified!"
		else  
		echo "args:rsync $1 $2"
		rsync $@
		fi
	
	fi
fi 
