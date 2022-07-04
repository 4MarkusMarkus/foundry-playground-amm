// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.9.0;

import "forge-std/Test.sol";
import "src/utils/MockERC20.sol";
import "src/amm.sol";

contract ContractTest is Test {
    AmmContract public ammContract;
    MockERC20 public token0;
    MockERC20 public token1;

    function setUp() public {
        token0 = new MockERC20("token0");
        token1 = new MockERC20("token1");
        ammContract = new AmmContract();
        uint256 ammount = 1000000*10e18;
        token0.approve(address(ammContract), ammount);
        token1.approve(address(ammContract), ammount/2);
        ammContract.fund(address(token0), address(token1), ammount, ammount/2); 


    }

    function test_fn_amountIn(uint128 ammountIn) public {
        // uint8 ammountIn // test with variable next time 
        // uint256 ammountIn = 10*10e18; //
        (bool success, uint256 ammountOut) = ammContract.swapInAmount(ammountIn, address(token0), address(token1));
        assertTrue(success);
        assertTrue(ammountIn >= ammountOut);
        
        // assertTrue(ammountIn < ammountOut);



        // console.log(out);
    }
}
