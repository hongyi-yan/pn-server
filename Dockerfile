# Use an official Node.js runtime as a parent image
FROM node:16-alpine

# Define build-time variable
ARG MONGO_CONNECTION_STRING
ARG PORT
ARG ACCESS_TOKEN_SECRET
ARG REFRESH_TOKEN_SECRET
ARG TEST_PORT
ARG MONGO_CONNECTION_STRING_TEST_DB

# Set the working directory to /app
WORKDIR /pn-server-backend

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm i

# Copy the rest of the application code to the container
COPY . .

# Set environment variables
ENV MONGO_CONNECTION_STRING=$MONGO_CONNECTION_STRING
ENV PORT=$PORT
ENV ACCESS_TOKEN_SECRET=$ACCESS_TOKEN_SECRET
ENV REFRESH_TOKEN_SECRET=$REFRESH_TOKEN_SECRET
ENV TEST_PORT=$TEST_PORT
ENV MONGO_CONNECTION_STRING_TEST_DB=$MONGO_CONNECTION_STRING_TEST_DB

# Expose port 5000 for the app to listen on
EXPOSE 5000

# Start the app
CMD ["npm", "run", "start"]