---
title: 'FFmpeg Tips'
date: 2024-07-29T13:22:41-04:00
draft: false
tags: ['Tech', 'Linux', 'Guide']
---

FFmpeg is one of my favorite tools, though it can be quite challenging to master. This page is dedicated to sharing the commands and knowledge I've accumulated from using FFmpeg.

**Check back soon for more updates!**

## Encoding Videos

Here's a simple reference for re-encoding videos.

### WEBM

For WEBM files, there are three common codecs: VP8, VP9, and AV1[^1].

#### VP8

```bash
ffmpeg -i video.mkv -c:v libvpx -c:a libvorbis video.webm
```

#### VP9

```bash
ffmpeg -i video.mkv -c:v libvpx-vp9 -c:a libopus video.webm
```

#### AV1

```bash
ffmpeg -i video.mkv -c:v libsvtav1 -c:a libopus video.webm
```

### MP4

For MP4 files, you can use the following codecs:

#### H.264 (x264)

```bash
ffmpeg -i video.mkv -c:v libx264 -c:a aac video.mp4
```

#### H.265 (x265)

```bash
ffmpeg -i video.mkv -c:v libx265 -c:a aac video.mp4
```

#### NVIDIA NVENC H.264

If you have an NVIDIA GPU, you can use the NVENC encoder for H.264:

```bash
ffmpeg -i video.mkv -c:v h264_nvenc -c:a aac video.mp4
```

#### NVIDIA NVENC H.265

For H.265 using NVIDIA NVENC:

```bash
ffmpeg -i video.mkv -c:v hevc_nvenc -c:a aac video.mp4
```

## Recording Screen

To record your screen, use the following command:

```bash
ffmpeg -y -f x11grab -s 1920x1080 -i :0.0 test.mkv
```

You can also add `-framerate 30` to set a custom frame rate.

### Recording Microphone

To record audio from your microphone:

```bash
ffmpeg -f alsa -i default -c:a flac test.flac
```

### Recording Screen and Microphone

To record both your screen and microphone:

```bash
ffmpeg -y -f x11grab -s 1920x1080 -i :0.0 -f alsa -i default test.mkv
```

With specific codecs:

```bash
ffmpeg -y -f x11grab -s 1920x1080 -i :0.0 -f alsa -i default -c:a flac -c:v libx264 test.mkv
```

[^1]: The FFmpeg codecs are: VP8 = `libvpx`, VP9 = `libvpx-vp9`, AV1 = `libsvtav1`.
