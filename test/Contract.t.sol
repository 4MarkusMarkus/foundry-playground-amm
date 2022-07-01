// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../utils/MockERC20.sol";
import "./amm.sol";

contract ContractTest is Test {
    AmmContract public ammContract;
    MockERC20 public mockERC20;
    function setUp() public {
        mockERC20 = new(MockERC20("token0"));

    }

    function testExample() public {
        assertTrue(true);
    }
}
