FROM node:20.18.0

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Jalankan Hardhat node (atau sesuaikan command-nya)
CMD ["npx", "hardhat", "node"]
