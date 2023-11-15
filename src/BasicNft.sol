// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// Imports
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 { 

    // The mapping over here will allow people to choose which NFT they want
    mapping(uint256 => string) private s_tokenIdToUri;
    
    // here we'll add a TokenId to be able keep track of each NFT we create
    uint256 public s_tokenCounter;
    // set the tokencounter to start from 0
    constructor()ERC721("splash", "SPLSH") {
        s_tokenCounter = 0;
    }
    // here in this fuanction we'll allowe people to choose which NFT they want
    function mintNFT(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        return s_tokenIdToUri[_tokenId];  
    }


}