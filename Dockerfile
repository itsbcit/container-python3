FROM bcit/alpine:3.9

LABEL maintainer="jesse_weisner@bcit.ca"
LABEL version="3.6.8-r2"

ENV VERSION "3.6.8-r2"

RUN apk add --no-cache \
    python3=3.6.8-r2 \
    py3-pip

RUN pip3 install --upgrade pip


ENTRYPOINT ["/sbin/tini", "--", "/docker-entrypoint.sh", "python3"]
