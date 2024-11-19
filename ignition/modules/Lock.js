const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
module.exports = buildModule("GenesisId", (m) => {
  const genesisID = m.contract("GenesisId");
  return { genesisID };
});
