// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

//Source: https://www.quicknode.com/guides/solidity/how-to-create-and-deploy-an-erc-721-nft

import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token-metadata.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/ownership/ownable.sol";
 
contract Mint is NFTokenMetadata, Ownable {
 
  string myURI; 
  bool isMinted; 

  constructor(string name, string symbol, string _uri) {
    nftName = name;
    nftSymbol = symbol;
    myURI = _uri;
  }
 
  function mint(address _to, uint256 _tokenId) external onlyOwner {
    bool isMinted = true;
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, myURI);
  }
 
}