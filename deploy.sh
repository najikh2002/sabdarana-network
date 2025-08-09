#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    print_error "Docker is not running. Please start Docker and try again."
    exit 1
fi

# Check if docker compose is available
if ! command -v docker compose &> /dev/null; then
    print_error "docker compose is not installed. Please install docker compose and try again."
    exit 1
fi

echo "🔨 Hardhat Deployment Script"
echo "=================================="
echo

# Build Docker image if needed
print_status "Building Docker image..."
if docker compose build hardhat; then
    print_success "Docker image built successfully"
else
    print_error "Failed to build Docker image"
    exit 1
fi

echo

# Deploy Token Contract
print_status "🚀 Deploying Token Contract..."
if docker compose --profile deploy run --rm deploy-token; then
    print_success "Token contract deployed successfully"
else
    print_error "Failed to deploy token contract"
    exit 1
fi

echo

# Deploy NFT Contract
print_status "🎨 Deploying NFT Contract..."
if docker compose --profile deploy run --rm deploy-nft; then
    print_success "NFT contract deployed successfully"
else
    print_error "Failed to deploy NFT contract"
    exit 1
fi

echo
print_success "✅ All contracts deployed successfully!"
echo
print_status "Deployment artifacts saved in ./artifacts directory"
print_status "You can now interact with your contracts on globalNode network"