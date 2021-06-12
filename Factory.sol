// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import "./Mint.sol";

contract Factory {
    // maps user addresses to NFT contract addresses
    mapping(address => address[]) whoOwnsWhat;

    function createMint(string memory name, 
                        string memory symbol, 
                        string memory _uri) public {
        Mint m = new Mint(name,
                        symbol,
                        _uri);
        address myAddr = address(m);
        whoOwnsWhat[msg.sender].push(myAddr);
    }

    function getNumNFTs (address myAddr) public view returns (uint) {
        return whoOwnsWhat[myAddr].length; 
    }

    event NFTData(address NFTaddr, string nftName, string nftSymbol, string myURI, bool isMinted);

    function tellMeAboutThisNFT (address NFT) {
        Mint internal myNFT = Mint(NFT);
        string myNFTnftName = myNFT.nftName;
        string myNFTnftSymbol = myNFT.nftSymbol;
        string myNFTURI = myNFT.myURI; 
        bool myNFTMintStatus = myNFT.isMinted;
        emit NFTData(NFT, myNFTnftName, myNFTnftSymbol, myNFTURI, myNFTMintStatus);
    }

}