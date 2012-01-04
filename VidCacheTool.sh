#!/bin/bash 
#IMPORTANT STUFF#

#Purpose: Operate on cached flash (flv) video Files
#VidCacheTool - V1.2
#CREATED BY RAFAEL L. 
#Released: 10-24-11
#Manifesto: Change this script as you see fit. Just give credit where credit is due. ;)

#If ffmpeg, xclip, or npviewer is not installed some operations may be unavailable.
#sudo apt-get install xclip ffmpeg

#IMPORTANT STUFF#

#set -x
#enter npviewer's virtual process dir
cd /proc/$(pidof npviewer.bin)/fd

#variables
fsize=$(ls -Lsh $(file -L $(ls) | grep Flash | cut -c1-2))
fname=$(file -L $(ls) | grep Flash| cut -c1-2)
listfs=$(ls -Lsh $(file -L $(ls) | grep Flash | cut -c1-2) | sort -s)


	if [ -z $(pidof npviewer.bin) ]; then

echo && echo "npviewer not running." && echo 

	elif  [ ! -z $(file -L $(ls) | grep Flash | cut -c1-2 | head -n1) ]; then



pwd #&& echo $fname -- $fsize | cut -c1-9
ls -Lsh $(file -L $(ls) | grep Flash | cut -c1-2) | sort -s
	
#options
echo
echo "1: copy file to videos"
echo "2: rip audio"
echo "3: update file stats"
echo "4: monitor file for changes"
echo "5: copy file path to clipboard"
echo "6: open video file"
echo
echo "enter any other keys to exit"

read state

	if [ $state = 1 ]; then
	
for vfile in $fname; do
echo
echo "what is the filename?" && read vname
cp $vfile $HOME/Videos/"$vname".mp4
echo copied filename $vfile to $HOME/Videos/"$vname".mp4
done

	elif [ $state = 2 ] ; then

	for vfile in $(file -L $(ls) | grep Flash | cut -c1-2); do
		mplayer $vfile && sleep 1s
		echo && echo "what is the name of file $vfile?" 
		read fname 
		ffmpeg -i $vfile -acodec copy -sameq $HOME/Music/Ripped\ audio/"$fname.aac" 
		echo "$vfile ripped to $HOME/Music/$fname.aac"
		done
	
	elif [ $state = 3 ] ; then
$fname -- $fsize | cut -c1-9 && sh $0 ###problem with reinitating the script again

	elif [ $state = 4 ] ; then
watch -n 3 -d ls -Lsh $(file -L $(ls) | grep Flash | cut -c1-2)
	
	elif [ $state = 5 ]; then

echo "copied $(echo $PWD/$fname) to clipboard"
echo $PWD/$fname | xclip -i -selection clipboard

	elif [ $state = 6 ]; then	

file -L $(ls) | grep "Flash" | cut -c1-2 | xargs mplayer;
		
	fi
	
		fi

#Check if Flash files are cached in folder.
#if [ -z $(file -L $(ls) | grep Flash | head -n1 | cut -c16-20) ]; then
#	echo && echo "no flash files cached in $PWD" && echo 
#	else sh $0
#fi

