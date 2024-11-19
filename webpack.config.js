module.exports = {
  externals: {
    ['@solana/web3.js']: 'commonjs @solana/web3.js',
  },
};

module.exports = {
  webpack: (config) => {
    config.externals['@solana/web3.js'] = 'commonjs @solana/web3.js';
    return config;
  },
};