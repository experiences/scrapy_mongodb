#
# Dockerfile
#

# Pull base image.
FROM dockerfile/mongodb
# ENV
ENV DEBIAN_FRONTEND noninteractive
# Install Python and libs.
RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv python-setuptools && \
  apt-get install -y build-essential libxml2-dev libxslt1-dev libffi-dev libssl-dev && \
  pip install requests scrapy service_identity pymongo scrapy-mongodb lxml w3lib cssselect twisted beautifulsoup4 queuelib && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /usr/local/lib/python2.7/dist-packages/requests && \
  rm -rf /tmp/*
# Define working directory.
WORKDIR /data
# Define default command.
CMD ["bash"]