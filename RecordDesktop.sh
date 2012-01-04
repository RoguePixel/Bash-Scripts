#!/bin/bash

clear

timestamp=$(date +%F) 
filename=$1-
#fslim=$2

echo 'recording in 3 seconds' && sleep 3s 


ffmpeg -y -f alsa -i pulse -f x11grab -r 30 -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -i :0.0 -acodec pcm_s16le screencast-audio-$(date +%F).wav -an -vcodec libxvid -sameq screencast-$(date +%F).avi



#SCRAP CODE#

#ffmpeg -an -f alsa -i pulse -f x11grab -r 30 -i :0.0 -s 1600x1200 -acodec pcm_s16le -ab 128k -vcodec libxvid  -sameq video-nosound.avi
#time \
#ffmpeg -an -s uxga  -f x11grab -r 30 -i :0.0 -s hd720 -vcodec libx264 -vpre lossless_ultrafast -threads 0 

#ffmpeg  -an -f alsa -i pulse -f x11grab -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -r 25 -i :0.0 -acodec pcm_s16le $filename"audio-$timestamp".wav $filename"capture-$timestamp".mpg

#ffmpeg -y -f alsa -ac 2 -i pulse -f x11grab -r 30 -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -i :0.0 -acodec pcm_s16le output.wav -an -vcodec libx264 -vpre lossless_ultrafast -threads 0 output.mp4


#   -aspect 1.3333
