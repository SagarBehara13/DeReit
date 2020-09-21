require('dotenv').config()
const HDWalletProvider = require('truffle-hdwallet-provider');
const kovanUrl = process.env.KOVAN_URL;
const fs = require('fs');
const mnemonic = fs.readFileSync(".secret").toString().trim();
console.log(mnemonic, kovanUrl);

module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 7545,
      network_id: "5777"
    },
    kovan: {
      provider: function() {
        return new HDWalletProvider(mnemonic, kovanUrl);
      },
      network_id: 42
    }
  },
  mocha: {
  },
  compilers: {
    solc: {
      version: "0.6.6",
    },
  },
};
