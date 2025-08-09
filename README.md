# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.js
```

# Hardhat Docker Setup

This project includes a complete Docker setup for running Hardhat development environment with easy deployment scripts.

## 📋 Prerequisites

- Docker and Docker Compose installed
- Git (for version control)

## 🚀 Quick Start

### 1. Setup Scripts

Make the scripts executable:

```bash
chmod +x deploy.sh docker-helper.sh
```

### 2. Build and Start

```bash
# Build Docker image and start Hardhat node
./docker-helper.sh build
./docker-helper.sh start
```

### 3. Deploy Contracts

```bash
# Deploy both token and NFT contracts
./deploy.sh
```

## 🛠️ Available Scripts

### Main Deployment Script

- `./deploy.sh` - Deploy all contracts to globalNode network

### Docker Helper Script

- `./docker-helper.sh start` - Start Hardhat node
- `./docker-helper.sh stop` - Stop all services
- `./docker-helper.sh restart` - Restart services
- `./docker-helper.sh logs` - View logs
- `./docker-helper.sh build` - Build Docker image
- `./docker-helper.sh compile` - Compile contracts
- `./docker-helper.sh test` - Run tests
- `./docker-helper.sh clean` - Clean up everything
- `./docker-helper.sh shell` - Open shell in container
- `./docker-helper.sh status` - Show container status

## 📁 Project Structure

```
hardhat/
├── contracts/          # Smart contracts
├── scripts/           # Deployment scripts
│   ├── deploy-token.js
│   └── deploy-nft.js
├── test/             # Test files
├── artifacts/        # Compiled contracts
├── cache/           # Hardhat cache
├── accounts.txt     # Account information
├── hardhat.config.js # Hardhat configuration
├── Dockerfile       # Docker configuration
├── docker-compose.yml # Docker Compose setup
├── deploy.sh        # Main deployment script
├── docker-helper.sh # Docker helper commands
└── README.md        # This file
```

## 🔧 Manual Commands

If you prefer to run commands manually:

### Start Development Environment

```bash
# Start Hardhat node
docker-compose up -d hardhat

# Check if it's running
curl -X POST -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_accounts","params":[],"id":1}' \
  http://localhost:8545
```

### Deploy Specific Contracts

```bash
# Deploy token contract
docker-compose --profile deploy run --rm deploy-token

# Deploy NFT contract
docker-compose --profile deploy run --rm deploy-nft

# Or deploy with custom command
docker-compose --profile deploy run --rm hardhat-deploy \
  npx hardhat run scripts/deploy-token.js --network globalNode
```

### Compile and Test

```bash
# Compile contracts
docker-compose run --rm hardhat npx hardhat compile

# Run tests
docker-compose --profile testing run --rm hardhat-test
```

## 🌐 Network Configuration

The setup uses `globalNode` network as specified in your `hardhat.config.js`. Make sure this network is properly configured with:

- RPC URL
- Chain ID
- Accounts/Private keys (if using `accounts.txt`)

## 📊 Monitoring

### View Logs

```bash
# Real-time logs
./docker-helper.sh logs

# Or manually
docker-compose logs -f hardhat
```

### Container Status

```bash
# Check container status
./docker-helper.sh status

# Or manually
docker-compose ps
```

## 🔍 Troubleshooting

### Container Won't Start

```bash
# Check Docker is running
docker info

# Rebuild image
./docker-helper.sh build
```

### Network Issues

```bash
# Check network configuration in hardhat.config.js
# Verify globalNode network settings
# Check accounts.txt file exists and has correct format
```

### Permission Issues

```bash
# Make scripts executable
chmod +x deploy.sh docker-helper.sh

# Fix file permissions
sudo chown -R $USER:$USER ./artifacts ./cache
```

### Clean Reset

```bash
# Complete cleanup and restart
./docker-helper.sh clean
./docker-helper.sh build
./docker-helper.sh start
```

## 📝 Development Workflow

1. **Start development environment:**

   ```bash
   ./docker-helper.sh start
   ```

2. **Make changes to contracts** in `./contracts/`

3. **Compile contracts:**

   ```bash
   ./docker-helper.sh compile
   ```

4. **Run tests:**

   ```bash
   ./docker-helper.sh test
   ```

5. **Deploy contracts:**

   ```bash
   ./deploy.sh
   ```

6. **View deployment artifacts** in `./artifacts/`

## 🔒 Security Notes

- Keep `accounts.txt` secure and never commit to version control
- Use environment variables for sensitive configuration
- Consider using `.env` files for different networks
- Review contract code before deployment

## 🤝 Contributing

1. Make changes to contracts or scripts
2. Test using `./docker-helper.sh test`
3. Deploy to testnet first
4. Document any configuration changes

## 📞 Support

If you encounter issues:

1. Check Docker and Docker Compose installation
2. Verify network configuration in `hardhat.config.js`
3. Review container logs with `./docker-helper.sh logs`
4. Try clean setup with `./docker-helper.sh clean`
