# This repo contains proposed code to solve a Solidity security challenge - quiz_mint

Based On :

Original question posted by from: Jeffrey Scholz at @Jeyffre / @RareSkills at @RareSkills_io

https://twitter.com/RareSkills_io/status/1580574243766800384

Inspired on the response posted by prady.eth at @prady_v

https://twitter.com/prady_v/status/1580583891072843778

The tests are made with foundry.

https://book.getfoundry.sh/getting-started/installation


# Installing Instructions


1 - Clone the github repo to your local machine:

git clone https://github.com/0xSchellen/quiz_mint.git
cd quiz_mint


2 - Initialize the git repository 

forge clean

git init
git branch -m main
git add .
git commit -m "initial"

3 - Initialize forge

forge init --force
forge install https://github.com/OpenZeppelin/openzeppelin-contracts.git

4 - Run the attack test 

forge test Attack.t.sol



The original posters are credited within the code.

This is a work in progress. Contributions are welcome!

Enjoy !