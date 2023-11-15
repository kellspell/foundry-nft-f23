// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Imports
import {Script} from "forge-std/Script.sol"; // Here is the main labrary import from forge-std
// import the contract to be deployed
import {BasicNft} from "../src/BasicNft.sol";

contract DeployBasicNFT is Script {
    function run() external returns (BasicNft) {
        vm.startBroadcast();
        BasicNft basicNft = new BasicNft();
        vm.stopBroadcast();
        return basicNft;
    }

}  