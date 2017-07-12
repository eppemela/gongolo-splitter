const GongoloSplitter = artifacts.require('GongoloSplitter')

module.exports = function(deployer) {
  deployer.deploy(GongoloSplitter)
}
