# Pull base image.
FROM alpine:latest

# File Author / Maintainer
MAINTAINER Shawn Bower <shawn.bower@gmail.com>

# variable for latest script version
ENV SCRIPT_VERSION 1.2.1

# Install Perl
RUN \
  apk add --update perl perl-net-ssleay perl-libwww perl-datetime \
    perl-switch perl-lwp-protocol-https coreutils unzip wget ruby && \
  rm -rf /var/cache/apk/*

# Define working directory.
WORKDIR /

RUN wget http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-${SCRIPT_VERSION}.zip
RUN unzip CloudWatchMonitoringScripts-${SCRIPT_VERSION}.zip
RUN rm CloudWatchMonitoringScripts-${SCRIPT_VERSION}.zip

COPY monitor.rb /opt/monitor.rb

# Define default command.
CMD ["/opt/monitor.rb"]
