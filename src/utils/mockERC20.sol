// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    constructor(string memory tokenName) ERC20 (tokenName, "TKN") {
        _mint(msg.sender, 1000000e32);
    }

}