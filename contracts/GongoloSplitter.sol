pragma solidity ^0.4.11;

contract GongoloSplitter {

  address[4] public listaAzionisti;
  address matteo = 0xa6499398392eDBd0774574122a7C6DAA1c3184af;
  address giuseppe = 0x7B3B5C3175D8BeEbae37419C174295975E0F1A29;
  address silvio = 0x601a4eE384ee41898E18716103E346b612a4d5dc;
  address andrea = 0xadfe237e909Bba2cAcae989b1BdC275E110C06fb;

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
