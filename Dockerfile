# Pull Latest Ubuntu 18.04
FROM ubuntu:latest
MAINTAINER Derek Purdy "dpurdy@gmail.com"

# Install git and npm 
RUN apt-get update && apt-get install -y \
    git \
    npm

# Clone the dimension GitHub Repository
RUN git clone https://github.com/turt2live/matrix-dimension.git

# Install Dimension
RUN cd matrix-dimension
RUN npm install
RUN npm run build

# Ports & Volumes
EXPOSE 8184
VOLUME /data