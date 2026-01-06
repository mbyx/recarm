FROM ubuntu:22.04

RUN apt-get update && apt-get install -y sudo

COPY . /app
WORKDIR /app

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN bash recarm