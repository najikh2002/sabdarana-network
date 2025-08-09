require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  networks: {
    sepolia: {
      url: "https://eth-sepolia.g.alchemy.com/v2/49gLhSjNV0mpSa1oqteeo",
      accounts: [ "2c52ba31dec7cf2f53d5ef4fbc6978f5735c6f4096f17ee3a4318096da70326c" ],
    },
    globalNode: {
      url: "https://sabdarana-network.arutalaaksara.com",
      chainId: 31337,
      accounts: ["5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a","59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d"]
    }
  },
};
