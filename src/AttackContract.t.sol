// SPDX-License-Identifier: NONE
pragma solidity ^0.8.15;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";

import {TokenERC721} from "../src/TokenERC721.sol";
import "openzeppelin-contracts/token/ERC721/IERC721Receiver.sol";
import {AttackContract} from "../src/AttackContract.sol";

contract AttackContractTest is Test { 
    TokenERC721 public token;
    AttackContract public attackContract; 

    address public attacker = address(0x11);
    address public tokenOwner = address(0x50);

    function setUp() public {
        vm.label(tokenOwner, "TokenOwner");
        vm.label(attacker, "Attacker");

        vm.prank(tokenOwner);
        token = new TokenERC721();

        vm.prank(attacker);     
        attackContract = new AttackContract();
    }

    function testAttackToken() public {
        vm.prank(attacker);     
        attackContract.mintAttack();
// SPDX-License-Identifier: NONE
pragma solidity ^0.8.15;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";

import {TokenERC721} from "../src/TokenERC721.sol";
import "openzeppelin-contracts/token/ERC721/IERC721Receiver.sol";
import {AttackContract} from "../src/AttackContract.sol";

contract AttackContractTest is Test { 
    TokenERC721 public token;
    AttackContract public attackContract; 

    address public attacker = address(0x11);
    address public tokenOwner = address(0x50);

    function setUp() public {
        vm.label(tokenOwner, "TokenOwner");
        vm.label(attacker, "Attacker");

        vm.prank(tokenOwner);
        token = new TokenERC721();

        vm.prank(attacker);     
        attackContract = new AttackContract();
    }

    function testAttackToken() public {
        vm.prank(attacker);     
        attackContract.mintAttack();

        // assertEq(token.totalSupply(), 1);
        // assertEq(token.balanceOf(attacker), 1); 

        console.log(token.balanceOf(attacker));          
        console.log(token.totalSupply()); 
        console.log(token.amountMinted(attacker));  
    }
}

    // function mint() external {
    //     require(amountMinted[msg.sender] != 1, "max 1 NFT");
    //     require(totalSupply < 10, "maximum supply");

    //     totalSupply++;
    //     _safeMint(msg.sender, totalSupply);
    //     amountMinted[msg.sender] = 1;
    // }
        // assertEq(token.totalSupply(), 1);
        // assertEq(token.balanceOf(attacker), 1); 

        console.log(token.balanceOf(attacker));          
        console.log(token.totalSupply()); 
        console.log(token.amountMinted(attacker));  
    }
}

    // function mint() external {
    //     require(amountMinted[msg.sender] != 1, "max 1 NFT");
    //     require(totalSupply < 10, "maximum supply");

    //     totalSupply++;
    //     _safeMint(msg.sender, totalSupply);
    //     amountMinted[msg.sender] = 1;
    // }