FROM bcit/alpine:3.10
LABEL maintainer="jesse_weisner@bcit.ca"
LABEL python_version="3.7.3"
LABEL python_apk_release="0"
LABEL build_id="1568395434"

RUN apk add --no-cache \
    python3=3.7.3-r0 \
    py3-pip

RUN pip3 install --upgrade pip


ENTRYPOINT ["/sbin/tini", "--", "/docker-entrypoint.sh", "python3"]
