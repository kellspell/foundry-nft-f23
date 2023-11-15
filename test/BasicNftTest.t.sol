// SPDX Lincense-Identifier: MIT


pragma solidity ^0.8.20;

// imports 
import {Test} from "forge-std/Test.sol";
import {DeployBasicNFT} from "../script/DeployBasicNFT.s.sol"; // "forge-std/DeployBasicNFT.sol";
import {BasicNft} from "../src/BasicNft.sol"; // "forge-std/BasicNft.sol";

// Down bellow is the test Setup
contract BasicNftTest is Test {
    DeployBasicNFT public deployer;
    BasicNft public basicNft; 

    // Add a simulated user
    address public USER = makeAddr("USER"); 

    // Add our NFT to be able to mint
    string public constant NFT_IMAGE = "https://ipfs.io/ipfs/QmPixnBtEgciVuPobTYJGqhW9SzqfnyUueMxBdrQkT4d1a?filename=splash.png";  

    function setUp() public {
        deployer = new DeployBasicNFT();
        basicNft = deployer.run();
        }
// Here lets start with our first test
function testNameIsCorrect() public {
    string memory expectedName = "splash";
    string memory actualName = basicNft.name();
    assertEq(basicNft.name(), "splash");
    }
/*
// Us we know we know ~Strigs are arrays of bytes and the only way to compare them is
// through keccak256, so we need to encodepacked them before comparing them
 */
function compareStrings(string memory expectedName, string memory actualName) internal pure returns (bool) {
    //return (keccak256(abi.encodePacked((expectedName))) == keccak256(abi.encodePacked((actualName))));
    assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
}

// Lets now write new test to check if user can mint a new NFT
// For that we need to simulate the user to mint a new NFT
// Also we need to add our NFT to be able to mint
function testCanMintAndHaveABalance() public {
    vm.prank(USER);
    basicNft.mintNFT(NFT_IMAGE);
    assertEq(basicNft.balanceOf(USER), 1);
    assert(keccak256(abi.encodePacked(NFT_IMAGE)) == keccak256(abi.encodePacked(basicNft.tokenURI(0))));
    }

}
