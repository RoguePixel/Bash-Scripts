#!/bin/bash

for song in *.mp3; do id3v2 -t "${song%.mp3}" "$song" && echo "added ID3 name to $song" && echo; done
