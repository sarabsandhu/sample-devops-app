FROM centos:latest

ARG COMMIT_REF
ARG BUILD_DATE

MAINTAINER sssingh@medline.com

#enable 
RUN yum install -y epel-release

# Add repo for Node.js 6
RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -

# Enable EPEL for Node.js
# RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Install Node...
RUN yum install -y nodejs

RUN npm config set strict-ssl false

# Copy app to /src
COPY . /src

# Install app and dependencies into /src
RUN cd /src; npm install

ENV APP_COMMIT_REF=${COMMIT_REF} \
    APP_BUILD_DATE=${BUILD_DATE}

EXPOSE 3000

CMD cd /src && node ./app.js