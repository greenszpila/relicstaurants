# Use a lightweight node.js image as the base
# FROM node:18.12.1-alpine
FROM alpine

RUN apk add --update nodejs npm

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application files to the container
COPY . .

# Set environment variables
ENV PORT 3000

# Expose the app port
EXPOSE 3000

# Start the app
CMD [ "npm" , "run", "newstart" ]
