# /*Basic Nft contract  */

// Okay is Project aimed for learning proposes and we're going to learn about NFT'S -
// before beggins lets install OpenZeppelin library that will allow us to get all functionaly we need to start over 
"forge install OpenZeppelin/openzeppelin-contracts --no-commit"
// after install our library we need to add the following line to our foundry.toml config file 
remmappings = ['@openzeppelin/contracts=lib/openzeppelin-contracts/contracts']

/*
// Us we know we know ~Strigs are arrays of bytes and the only way to compare them is
// through keccak256, so we need to encodepacked them before comparing them
 */
function compareStrings(string memory a, string memory b) internal pure returns (bool) {
    return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
}

A good tool to use for that job is chisel 
## Chisel lets you to  see the RexDecimal of each string words

Lets do it!

1. Step One 
➜ string memory cat = "cat"
➜ string memory dog = "kell"
➜ dog
Type: string
├ UTF-8: kell
├ Hex (Memory):
├─ Length ([0x00:0x20]): 0x0000000000000000000000000000000000000000000000000000000000000004
├─ Contents ([0x20:..]): 0x6b656c6c00000000000000000000000000000000000000000000000000000000
├ Hex (Tuple Encoded):
├─ Pointer ([0x00:0x20]): 0x0000000000000000000000000000000000000000000000000000000000000020
├─ Length ([0x20:0x40]): 0x0000000000000000000000000000000000000000000000000000000000000004
└─ Contents ([0x40:..]): 0x6b656c6c00000000000000000000000000000000000000000000000000000000
➜ cat
Type: string
├ UTF-8: cat
├ Hex (Memory):
├─ Length ([0x00:0x20]): 0x0000000000000000000000000000000000000000000000000000000000000003
├─ Contents ([0x20:..]): 0x6361740000000000000000000000000000000000000000000000000000000000
├ Hex (Tuple Encoded):
├─ Pointer ([0x00:0x20]): 0x0000000000000000000000000000000000000000000000000000000000000020
├─ Length ([0x20:0x40]): 0x0000000000000000000000000000000000000000000000000000000000000003
└─ Contents ([0x40:..]): 0x6361740000000000000000000000000000000000000000000000000000000000
// Here above is the RexDecimal of the words cat and dog
// And the way to encode our string is like that

2. Step Two
➜ bytes memory encodedCat = abi.encodePacked(cat);
➜ encodedCat
Type: dynamic bytes
├ Hex (Memory):
├─ Length ([0x00:0x20]): 0x0000000000000000000000000000000000000000000000000000000000000003
├─ Contents ([0x20:..]): 0x6361740000000000000000000000000000000000000000000000000000000000
├ Hex (Tuple Encoded):
├─ Pointer ([0x00:0x20]): 0x0000000000000000000000000000000000000000000000000000000000000020
├─ Length ([0x20:0x40]): 0x0000000000000000000000000000000000000000000000000000000000000003
└─ Contents ([0x40:..]): 0x6361740000000000000000000000000000000000000000000000000000000000

3. Step Three
// And here is the RexDecimal converted into a crytograph bytes32 data 
➜ bytes32 catHash = keccak256(encodedCat)
➜ catHash
Type: bytes32
└ Data: 0x52763589e772702fa7977a28b3cfb6ca534f0208a2b2d55f7558af664eac478a

// So to Summarize! we can convert our strings into dynamic bites Rexdecimal , after convergion , we can convert our strings bytes
// into bytes32 hash and use the hashes of the variables for comparison eachother

# Integrations
// For the integrations part we'll need to install the devops package from chainlink , here the code 
// forge install ChainAccelOrg/foundry-devops --no-commit

# ffi = true  
// It needs to add this config to our foundry.toml file , before deployments

# Deployment command 
// make deploy ARGS="--network sepolia"

# Mint Command
// make mint ARGS="--network sepolia"


