FROM alpine

RUN apk update \
 && apk add --no-cache --virtual=dependencies \
      gcc \
      libffi-dev \
      musl-dev \
      openssl-dev \
      py-pip \
      python-dev \
 && apk add --no-cache --update \
      ansible \
 && pip install "pywinrm>=0.3.0" \
 && apk del --purge dependencies \
 && rm /var/cache/apk/*
