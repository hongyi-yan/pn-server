# Use an official Node.js runtime as a parent image
FROM node:16-alpine

# install Node.js and the npm package manager on an Alpine Linux system using the package manager apk
RUN apk add --no-cache nodejs npm

# Set the working directory to /app
WORKDIR /pn-server-backend

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm i

# Copy the rest of the application code to the container
COPY . .

COPY .env pn-server-backend/.env

# remove bcrypt package
RUN npm uninstall bcrypt

# install bcrypt package
RUN npm install bcrypt

# Expose port 5000 for the app to listen on
EXPOSE 5000

# Start the applsof -i tcp:3000
CMD ["npm", "run", "start"]