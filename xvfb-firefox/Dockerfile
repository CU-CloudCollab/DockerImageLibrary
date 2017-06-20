# Pull base image.
FROM ubuntu:16.04

# File Author / Maintainer
LABEL maintainer "Shawn Bower <shawn.bower@gmail.com>"

# Select firefox version to install
ENV GECKO_DRIVER v0.17.0

# Get xvfb and grab firefox from apt to get all the dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
 build-essential \
 ca-certificates \
 wget \
 firefox \
 xvfb

RUN wget -q --continue --output-document geckodriver.tar.gz \
      "https://github.com/mozilla/geckodriver/releases/download/${GECKO_DRIVER}/geckodriver-${GECKO_DRIVER}-linux64.tar.gz" && \
    tar xzf geckodriver.tar.gz && \
    mv geckodriver /usr/local/bin/geckodriver && \
    chmod 775 /usr/local/bin/geckodriver
