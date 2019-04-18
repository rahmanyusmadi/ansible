FROM alpine

RUN apk update \
 && apk add --no-cache --virtual=dependencies \
      gcc \
      libffi-dev \
      musl-dev \
      openssl-dev \
      py-pip \
      python-dev \
 && pip install --upgrade pip \
 && apk add --no-cache --update \
      python3 \
      py3-crypto \
      py3-jinja2 \
      py3-markupsafe \
      py3-paramiko \
      py3-yaml \
      ansible \
 && pip3 install --upgrade pip \
 && pip3 install "pywinrm>=0.3.0" \
 && apk del --purge dependencies \
 && rm /var/cache/apk/*
