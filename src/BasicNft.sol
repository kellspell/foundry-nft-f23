// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// Imports
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

Contract BasicNft is ERC721 { 
    
    // here we'll add a TokenId to be able keep track of each NFT we create
    uint256 public s_tokenCounter;
    // set the tokencounter to start from 0
    constructor()ERC721("splash", "SPLSH") {
        s_tokenCounter = 0;
    }

    function mintNFT() public {}

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        return "";
    }


}