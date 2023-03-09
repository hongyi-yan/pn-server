# Use an official Node.js runtime as a parent image
FROM node:16-alpine

# Set the working directory to /app
WORKDIR /pn-server-backend

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm i

# Copy the rest of the application code to the container
COPY . .

# Expose port 5000 for the app to listen on
EXPOSE 5000

# Start the app
CMD ["npm", "run", "start"]