# Gunakan image node versi LTS
FROM node:18

# Set working directory
WORKDIR /app

# Copy file konfigurasi
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy semua file project
COPY . .

# Perintah default container (opsional)
CMD ["npx", "hardhat"]
