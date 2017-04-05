#!/bin/sh

aws s3 cp s3://${S3_CONFIG_BUCKET}/pypi-secret.ini /tmp/pypi-secret.ini
cat  /tmp/pypi-secret.ini >> /etc/pypicloud/config.ini

uwsgi --ini-paste-logged /etc/pypicloud/config.ini
