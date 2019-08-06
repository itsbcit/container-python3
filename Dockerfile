FROM bcit/alpine:3.10

LABEL maintainer="jesse_weisner@bcit.ca"
LABEL version="3.7.3-r0"

ENV VERSION "3.7.3-r0"

RUN apk add --no-cache \
    python3=3.7.3-r0 \
    py3-pip

RUN pip3 install --upgrade pip


ENTRYPOINT ["/sbin/tini", "--", "/docker-entrypoint.sh"]

CMD ["python3"]
