// SPDX-License-Identifier: NONE
pragma solidity ^0.8.15;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";

import {TokenERC721} from "../src/TokenERC721.sol";
import "openzeppelin-contracts/token/ERC721/IERC721Receiver.sol";
import {Attack} from "../src/Attack.sol";

contract TestAttack is Test { 
    TokenERC721 public token; 
    Attack public attack;     
    address public hacker;

    function setUp() public {
        hacker = address(0x11);
        vm.label(hacker, "hacker");
        vm.prank(hacker);     
        attack = new Attack();
    }

    function testAttackToken() public {
        vm.startPrank(hacker);     
        attack.mintAttack();

        // Withdraw 
        for (uint i =1; i <= 10; i++) {
            attack.withdraw(address(attack), address(hacker), i );
        }

       assertEq(attack.getTokenBalanceOf(hacker), 10); 
       assertEq(attack.getTokenBalanceOf(hacker), 10); 

        // console.log(token.balanceOf(hacker));          
        // console.log(token.totalSupply()); 
        // console.log(token.amountMinted(hacker));  
    }
}

    // function mint() external {
    //     require(amountMinted[msg.sender] != 1, "max 1 NFT");
    //     require(totalSupply < 10, "maximum supply");

    //     totalSupply++;
    //     _safeMint(msg.sender, totalSupply);
    //     amountMinted[msg.sender] = 1;
    // }