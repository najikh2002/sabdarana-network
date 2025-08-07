const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying Widya with:", deployer.address);

  const Widya = await ethers.getContractFactory("Widya");
  const token = await Widya.deploy(deployer.address);
  await token.waitForDeployment();

  console.log("Widya token deployed to:", await token.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
