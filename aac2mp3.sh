#!/bin/bash

ip=aac
op=mp3

for f in *.aac; do 
	ffmpeg -y -i "$f" -sameq -b 128kb "${f%.$ip}.$op"
done
