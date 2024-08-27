// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import {MessageHashUtils} from "@openzeppelin/contracts/utils/cryptography/MessageHashUtils.sol";
import {console} from "forge-std/console.sol";

contract RandomToken is ERC20 {
    constructor() ERC20("", "") {}

    function freeMint(uint256 amount) public {
        _mint(msg.sender, amount);
    }
}

contract TokenSender {
    using ECDSA for bytes32;

    function transfer(address sender, uint256 amount, address recipient, address tokenContract, bytes memory signature)
        public
    {
        // Calculate the hash of all the requisite values
        bytes32 messageHash = getHash(sender, amount, recipient, tokenContract);
        // Converrt it to a signed message hash
        bytes32 signedMessageHash = MessageHashUtils.toEthSignedMessageHash(messageHash);

        // Extract the original signer address
        address signer = signedMessageHash.recover(signature);

        // Make sure signer is the person on whose behalf we're executing the transaction
        require(signer == sender, "Signature does not come from sender");

        // Transfer tokens from sender(signer) to recipient

        bool sent = ERC20(tokenContract).transferFrom(sender, recipient, amount);
        require(sent, "Transfer failed");
    }

    // Helper function to calculate the kaccak256 hash
    function getHash(address sender, uint256 amount, address recipient, address tokenContract)
        public
        pure
        returns (bytes32)
    {
        return keccak256(abi.encodePacked(sender, amount, recipient, tokenContract));
    }
}