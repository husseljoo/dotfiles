#!/bin/bash

# to include audio add these:(-f alsa -ac 2 -i pulse -acodec pcm_s16le)

tmpPID="/tmp/screencast.pid"
outputDir="$HOME/scripts"
outputCast="$outputDir/screencast_example.mkv"
outputAudio="$outputDir/recording.wav"
outputVideo="$outputDir/final_movie.mp4"

vcodec="h264_nvenc" # make it GPU accelerated
framerate=30
video_size="1920x1080"

if [ -s $tmpPID ];then
    kill $(cat $tmpPID)
    rm -rf $tmpPID
    echo "HERE"
    if [ -e $outputCast ] && [ -e $outputAudio ];then
        ffmpeg -i "$outputCast" -i "$outputAudio" -c:v copy -c:a aac -strict experimental "$outputVideo"
        rm $outputCast
        rm $outputAudio
    fi
else
   ffmpeg -framerate $framerate -video_size $video_size -f x11grab -i :0 -vcodec "$vcodec" -preset fast -crf 0 -threads 0 -y "$outputCast" & echo $! > $tmpPID
   arecord -D sysdefault:CARD=Mini -f cd -c 1 -r 44100 -t wav "$outputAudio" & echo $! >> $tmpPID
fi

# need to notify status bar (have some indicator on the state of the recording)
# pkill -RTMIN+10 i3blocks
