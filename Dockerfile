FROM ubuntu:trusty

ENV AWS_ACCESS_KEY_ID=""
ENV AWS_SECRET_ACCESS_KEY=""
ENV AWS_REGION=""

ADD bootstrap-development.sh /root/bootstrap-development.sh
ADD bootstrap-common.sh /root/bootstrap-common.sh

RUN ls /root

RUN set -xe && /root/bootstrap-development.sh
RUN set -xe && /root/bootstrap-common.sh

VOLUME /host/share

cmd ["/bin/bash"]
