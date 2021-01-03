#!/bin/bash

# Use root user
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

apt update
apt upgrade

apt-get install cmake m4 git build-essential

apt-get install libssl-dev libcurl4-openssl-dev liblog4cplus-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev gstreamer1.0-plugins-base-apps gstreamer1.0-plugins-bad gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-tools

mkdir kinesis
cd kinesis
git clone https://github.com/awslabs/amazon-kinesis-video-streams-producer-sdk-cpp.git .

mkdir build; cd build; cmake .. -DBUILD_GSTREAMER_PLUGIN=ON

make

