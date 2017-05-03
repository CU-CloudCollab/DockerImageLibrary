# Pull base image.
FROM alpine:3.5

# File Author / Maintainer
LABEL maintainer "Shawn Bower <shawn.bower@gmail.com>"

# Install python libraries and pypicloud
RUN apk add --update \
    openssl \
    python \
    python-dev \
    py-pip \
    build-base \
    linux-headers && \
  pip install pypicloud[server] awscli uwsgi && \
  rm -rf /var/cache/apk/*

# Add the pypicloud config file
RUN mkdir -p /etc/pypicloud
COPY config.ini /etc/pypicloud/config.ini
COPY init.sh /opt/init.sh

# Expose default port
EXPOSE 6543

CMD /opt/init.sh
