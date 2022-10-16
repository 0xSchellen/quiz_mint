// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.15;

import "openzeppelin-contracts/token/ERC721/ERC721.sol";

// OP https://twitter.com/RareSkills_io/status/1580574243766800384
// OP https://twitter.com/prady_v/status/1580583891072843778

contract TokenERC721 is ERC721 {
    mapping(address => uint256) public amountMinted;
    uint256 public totalSupply;

    constructor() ERC721("Wrong NFT", "Wrong") {}

    function mint() external {
        require(amountMinted[msg.sender] != 1, "max 1 NFT");
        require(totalSupply < 10, "maximum supply");

        totalSupply++;
        _safeMint(msg.sender, totalSupply);
        amountMinted[msg.sender] = 1;
    }
}