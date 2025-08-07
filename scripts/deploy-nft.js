const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying Sabdarana NFT with:", deployer.address);

  const Sabdarana = await ethers.getContractFactory("Sabdarana");
  const nft = await Sabdarana.deploy(deployer.address);
  await nft.waitForDeployment();

  console.log("Sabdarana NFT deployed to:", await nft.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
