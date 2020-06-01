# Pull Latest Ubuntu 18.04
FROM node:latest
MAINTAINER Derek Purdy

# set our node environment, either development or production
# defaults to production, compose overrides this to development on build and run
ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

# Ports & Volumes
EXPOSE 8184
VOLUME /data

# Update npm
RUN npm i npm@latest -g

# Install git and npm 
RUN apt-get update && apt-get install -y git

# Clone the dimension GitHub Repository
RUN mkdir /app
RUN git clone -b docker https://github.com/turt2live/matrix-dimension.git /app
WORKDIR /app

# Clone the dimension GitHub Repository
RUN git clone https://github.com/turt2live/matrix-dimension.git

# Install Dimension
RUN cd matrix-dimension
RUN npm install
RUN npm run build
