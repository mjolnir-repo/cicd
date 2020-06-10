FROM python:3.6-alpine

# Install new packages
RUN apk add --update build-base python3-dev python3 py-pip jpeg-dev zlib-dev libffi-dev openssl-dev git openssh-client sshpass

# Upgrade pip
RUN pip install --upgrade pip

# Change LIBRARY_PATH environment variable because of error in building zlib
ENV LIBRARY_PATH=/lib:/usr/lib

# Install ansible
ARG ANSIBLE_VERSION=2.5

RUN pip install ansible==$ANSIBLE_VERSION

# Set Workdir
WORKDIR /ansible

# Define volumes
VOLUME [ "/ansible", "/ansible/playbooks", "/root/.ssh" ]