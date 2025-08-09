#!/bin/bash
# docker-helper.sh - Collection of Docker helper scripts

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

case "$1" in
    "start")
        print_status "🚀 Starting Hardhat node..."
        docker-compose up -d hardhat
        print_success "Hardhat node is running on http://localhost:8545"
        ;;

    "stop")
        print_status "⏹️ Stopping all services..."
        docker-compose down
        print_success "All services stopped"
        ;;

    "restart")
        print_status "🔄 Restarting Hardhat node..."
        docker-compose restart hardhat
        print_success "Hardhat node restarted"
        ;;

    "logs")
        print_status "📋 Showing logs..."
        docker-compose logs -f hardhat
        ;;

    "build")
        print_status "🔨 Building Docker image..."
        docker-compose build
        print_success "Build completed"
        ;;

    "compile")
        print_status "⚙️ Compiling contracts..."
        docker-compose run --rm hardhat npx hardhat compile
        print_success "Contracts compiled"
        ;;

    "test")
        print_status "🧪 Running tests..."
        docker-compose --profile testing run --rm hardhat-test
        ;;

    "clean")
        print_status "🧹 Cleaning up..."
        docker-compose down --rmi all --volumes --remove-orphans
        print_success "Cleanup completed"
        ;;

    "shell")
        print_status "💻 Opening shell in container..."
        docker-compose run --rm hardhat bash
        ;;

    "status")
        print_status "📊 Container status:"
        docker-compose ps
        ;;

    *)
        echo "🔧 Hardhat Docker Helper"
        echo "========================"
        echo
        echo "Usage: $0 {command}"
        echo
        echo "Available commands:"
        echo "  start     - Start Hardhat node"
        echo "  stop      - Stop all services"
        echo "  restart   - Restart Hardhat node"
        echo "  logs      - Show container logs"
        echo "  build     - Build Docker image"
        echo "  compile   - Compile contracts"
        echo "  test      - Run tests"
        echo "  clean     - Clean up everything"
        echo "  shell     - Open shell in container"
        echo "  status    - Show container status"
        echo
        echo "Examples:"
        echo "  $0 start"
        echo "  $0 compile"
        echo "  $0 test"
        ;;
esac