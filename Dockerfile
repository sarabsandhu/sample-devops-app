FROM centos:latest

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

EXPOSE 8080

CMD cd /src && node ./app.js