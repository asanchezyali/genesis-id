require("@nomicfoundation/hardhat-toolbox");

const fs = require("fs");
const privateKey = fs.readFileSync("secret.txt").toString().trim();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  defaultNetwork: "localhost",
  networks: {
    hardhat: {
      chainId: 4202,
    },
    sepolia: {
      url: "https://sepolia.infura.io",
      accounts: [privateKey],
      gasPrice: 10000000000,
    },
  },
  solidity: "0.8.27",
  allowUnlimitedContractSize: true,
  throwOnTransactionFailures: true,
  throwOnCallFailures: true,
  loggingEnabled: true,
};
