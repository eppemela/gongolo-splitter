pragma solidity ^0.4.11;

contract GongoloSplitter {

  address[4] public listaAzionisti;
  address matteo = 0xcB5C7016F0dC9A368B403216B6998AfcCeFbe3d5;
  address giuseppe = 0x7B3B5C3175D8BeEbae37419C174295975E0F1A29;
  address silvio = 0x15E6316E136e7DA5432D81af81E259BDa33F6F6f;
  address andrea = 0xDfC9dE0A9b301Cf28192705121E8958af23d5819;

  event EthReceived(address sender, uint amount);
  event EthSent(address beneficiary, uint amount);

  function GongoloSplitter() {
    listaAzionisti[0]= matteo;
    listaAzionisti[1]= giuseppe;
    listaAzionisti[2]= silvio;
    listaAzionisti[3]= andrea;
  }

  function () payable {
      pay();
  }

  function pay() public payable returns(bool success)
  {
    require(msg.value > 0);
    EthReceived(msg.sender, msg.value);
    uint forth = msg.value / 4;
    for (uint i = 0; i < listaAzionisti.length; i++) {
      listaAzionisti[i].transfer(forth);
      EthSent(listaAzionisti[i], forth);
    }
    return true;
  }
}
