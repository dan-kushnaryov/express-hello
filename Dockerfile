# Set the base image.
FROM node:10

# Create and define the node_modules's cache directory.
RUN mkdir /usr/src/cache
WORKDIR /usr/src/cache

# Install the application's dependencies into the node_modules's cache directory.
COPY package.json ./
COPY package-lock.json ./
RUN npm install

# Create and define the application's working directory.
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

ENTRYPOINT ["sh", "/usr/src/app/entrypoint.sh"]

# Bundle app source
# COPY . .

# CMD [ "npm", "start" ]