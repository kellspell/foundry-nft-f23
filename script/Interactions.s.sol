// SPDX-LICENSE-Identifier: MIT

pragma solidity ^0.8.20;

// Imports
import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";



contract MintBasicNft is Script {
    // Add our NFT to be able to mint
    string public constant NFT_IMAGE = "https://ipfs.io/ipfs/QmPixnBtEgciVuPobTYJGqhW9SzqfnyUueMxBdrQkT4d1a?filename=splash.png";  

    function run() external{
    address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
    mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNFT(NFT_IMAGE);
        vm.stopBroadcast();
        
    }
}