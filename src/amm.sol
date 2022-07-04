// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "lib/openzeppelin-contracts/contracts/utils/math/SafeMath.sol";


contract AmmContract {

    using SafeMath for uint256;

    function fund(address token0, address token1, uint256 ammount0, uint256 ammount1) public {
        IERC20(token0).transferFrom(msg.sender, address(this), ammount0);
        IERC20(token1).transferFrom(msg.sender, address(this), ammount1);
    }

    function swapInAmount(uint256 ammountIn, address tokenIn, address tokenOut) public view returns(bool, uint256 ammountOut) {
        uint256 inBalance = IERC20(tokenIn).balanceOf(address(this));
        uint256 outBalance = IERC20(tokenOut).balanceOf(address(this));
        uint256 numerator = ammountIn.mul(outBalance);
        uint256 denominator = inBalance.add(ammountIn);
        uint256 ammountOut = numerator.div(denominator);
        return (true, ammountOut);

    }
    
    
}
