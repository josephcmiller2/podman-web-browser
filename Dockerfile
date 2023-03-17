#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:22.04

RUN \
  mkdir /shared && \
  apt-get update && \
  apt-get install -y gnupg wget software-properties-common wget && \
  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /etc/apt/trusted.gpg.d/google-chrome.gpg && \
  apt-get remove -y wget && \
  add-apt-repository -y "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" && \
  apt-get update && \
  apt-get install -y google-chrome-stable

RUN \
  apt-get install -y 'fonts-*'

RUN \
  apt-get install -y snapd pulseaudio && \
  systemctl enable snapd

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
