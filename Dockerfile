# Use Node.js version 20 to match local environment
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apk add --no-cache git python3 make g++

# Copy package files first for better caching
COPY package*.json ./

# Clean install dependencies
RUN npm ci

# Verify hardhat is installed
RUN npx hardhat --version || npm install --save-dev hardhat

# Copy project files
COPY . .

# Create directory for artifacts if it doesn't exist
RUN mkdir -p artifacts cache

# Set proper permissions
RUN chown -R node:node /app
USER node

# Expose port for Hardhat node
EXPOSE 8545

# Default command with full path
CMD ["npx", "hardhat", "node", "--hostname", "0.0.0.0"]