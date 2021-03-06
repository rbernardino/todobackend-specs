FROM ubuntu:latest
LABEL Author='Ryan Bernardino <r.bernardino17@gmail.com>'

# Prevent dpkg errors
ENV TERM=xterm-256color

# Set mirrors to PH
RUN sed -i "s/http:\/\/archive./http:\/\/ph.archive./g" /etc/apt/sources.list 

# Install node.js
RUN apt-get update && \
    apt-get install curl -y && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs 

COPY . /app
WORKDIR /app

# Install application dependencies
RUN npm install -g mocha && \
    npm install -g mocha-jenkins-reporter && \
    npm install

# Set mocha test runner as entrypoint
ENTRYPOINT ["mocha"]

