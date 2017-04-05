# Pull base image
FROM alpine:latest
LABEL maintainer "Scott Ross <sr523@cornell.edu>"

# Add AWS to install oracle
RUN apk -Uuv add groff less python py-pip && \
    pip install awscli && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/* && \
    apk add --update libaio && \
    apk add --update unzip

#ADD ORACLE INSTANT CLIENT
RUN mkdir -p opt/oracle
RUN aws s3 cp s3://vmit-public/oracle/instantclient-basic-linux.x64-12.1.0.2.0.zip . --no-sign-request
RUN aws s3 cp s3://vmit-public/oracle/instantclient-sdk-linux.x64-12.1.0.2.0.zip . --no-sign-request

RUN unzip instantclient-basic-linux.x64-12.1.0.2.0.zip -d /opt/oracle \
  && unzip instantclient-sdk-linux.x64-12.1.0.2.0.zip -d /opt/oracle  \
  && mv /opt/oracle/instantclient_12_1 /opt/oracle/instantclient \
  && ln -s /opt/oracle/instantclient/libclntsh.so.12.1 /opt/oracle/instantclient/libclntsh.so \
  && ln -s /opt/oracle/instantclient/libocci.so.12.1 /opt/oracle/instantclient/libocci.so

## Environment Variables for oracle
ENV LD_LIBRARY_PATH="/opt/oracle/instantclient"
ENV OCI_HOME="/opt/oracle/instantclient"
ENV OCI_LIB_DIR="/opt/oracle/instantclient"
ENV OCI_INCLUDE_DIR="/opt/oracle/instantclient/sdk/include"
