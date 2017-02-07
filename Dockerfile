##############################
# Dockerfile for EventRetrieve
# BigDataEurope
#
# git 1.9.1
# Python 2.7
# Django 1.10.5
##############################

FROM ubuntu:14.04
MAINTAINER Giorgos Argyriou <gioargyr@gmail.com>

# INSTALL PREREQUISITIES
RUN apt-get update \
 && apt-get install -y \
    wget \
    curl \
    git \
    python-pip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN pip install django \
 && mkdir /input \
 && git clone https://github.com/gioargyr/EventRetrieve.git

EXPOSE 8000

WORKDIR /EventRetrieve

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]