FROM ruby:2.3
LABEL maintainer "Scott Ross <sr523@cornell.edu>"

# And also installed libaio1, build-essential and curl
RUN apt-get update
RUN apt-get install -y unzip libaio-dev
RUN apt-get clean -y

#INSTALL LIBAIO1 & UNZIP (NEEDED FOR STRONG-ORACLE).  Also add AWS Cli to we can pull down
# Oracle sources.
RUN apt-get update \
  && apt-get install -y apt-utils libaio1 build-essential unzip awscli \
  && mkdir -p opt/oracle \
  && aws s3 cp s3://vmit-public/oracle/instantclient-basic-linux.x64-12.1.0.2.0.zip . --no-sign-request \
  && aws s3 cp s3://vmit-public/oracle/instantclient-sdk-linux.x64-12.1.0.2.0.zip . --no-sign-request \
  && unzip instantclient-basic-linux.x64-12.1.0.2.0.zip -d /opt/oracle \
  && unzip instantclient-sdk-linux.x64-12.1.0.2.0.zip -d /opt/oracle  \
  && mv /opt/oracle/instantclient_12_1 /opt/oracle/instantclient \
  && ln -s /opt/oracle/instantclient/libclntsh.so.12.1 /opt/oracle/instantclient/libclntsh.so \
  && ln -s /opt/oracle/instantclient/libocci.so.12.1 /opt/oracle/instantclient/libocci.so

ENV LD_LIBRARY_PATH="/opt/oracle/instantclient"
ENV OCI_HOME="/opt/oracle/instantclient"
ENV OCI_LIB_DIR="/opt/oracle/instantclient"
ENV OCI_INCLUDE_DIR="/opt/oracle/instantclient/sdk/include"

RUN echo '/opt/oracle/instantclient/' | tee -a /etc/ld.so.conf.d/oracle_instant_client.conf && ldconfig
