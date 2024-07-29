---
title: 'FFmpeg Tips'
date: 2024-07-29T13:22:41-04:00
draft: false
tags: ['Tech', 'Linux', 'Guide']
---

FFmpeg is one of my favorite programs, though it can be quite difficult to learn. 
This page is dedicated to sharing the commands and knowledge I've accumulated over my time of using FFmpeg.

**More will come to this page soon!**

## To record screen.

`ffmpeg -y -f x11grab -s 1920x1080 -i :0.0 test.mkv`

You can also add `-framerate 30` to set a custom frame rate.

## To record mic.

`ffmpeg -f alsa -i default -c:a flac test.flac`

## To record screen and mic. 

`ffmpeg -y -f x11grab -s 1920x1080 -i :0.0 -f alsa -i default test.mkv`

The command with codecs: 

`ffmpeg -y -f x11grab -s 1920x1080 -i :0.0 -f alsa -i default -c:a flac -c:v libx264 test.mkv`
