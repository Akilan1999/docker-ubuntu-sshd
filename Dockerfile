# -----------------------------------------------------------------------------
# This is base image of Ubuntu LTS with SSHD service.
#
# Authors: Art567
# Updated: Sep 20th, 2015
# Require: Docker (http://www.docker.io/)
# -----------------------------------------------------------------------------


# Base system is the latest LTS version of Ubuntu.
# from   consol/ubuntu-xfce-vnc

# due to dependency issues vnc is still work in progress
FROM ubuntu:20.04

# Switch to root user to install additional software
USER 0


# Make sure we don't get notifications we can't answer during building.
ENV    DEBIAN_FRONTEND noninteractive


# Prepare scripts and configs
ADD ./scripts/ .


RUN ./init.sh


# Port 22 is used for ssh
EXPOSE 22


# Assign /data as static volume.
VOLUME ["/data"]



# Starting sshd
#cmd    ["/start.sh"]
CMD    ["sh"]
