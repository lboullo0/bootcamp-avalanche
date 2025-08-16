// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title SwapMockFixed1to1
/// @notice Contrato de intercambio fijo 1:1 entre dos tokens ERC-20
contract SwapMockFixed1to1 is Ownable {
   IERC20 public tokenA;
   IERC20 public tokenB;

   event TokenSwapped(address indexed user, string direction, uint256 amountIn, uint256 amountOut);
   event LiquidityAdded(address indexed provider, uint256 amountTokenA, uint256 amountTokenB);
   event LiquidityRemoved(address indexed to, uint256 amountTokenA, uint256 amountTokenB);

   constructor(address _tokenA, address _tokenB) Ownable(msg.sender) {
       require(_tokenA != address(0) && _tokenB != address(0), "Invalid token address");
       tokenA = IERC20(_tokenA);
       tokenB = IERC20(_tokenB);
   }

   /// @notice Permite agregar liquidez al contrato
   function addLiquidity(uint256 amountA, uint256 amountB) external {
       require(amountA > 0 && amountB > 0, "Amounts must be > 0");

       tokenA.transferFrom(msg.sender, address(this), amountA);
       tokenB.transferFrom(msg.sender, address(this), amountB);

       emit LiquidityAdded(msg.sender, amountA, amountB);
   }

   /// @notice Permite al owner retirar liquidez del contrato
   function removeLiquidity(uint256 amountA, uint256 amountB) external onlyOwner {
       require(amountA <= tokenA.balanceOf(address(this)), "Not enough TokenA");
       require(amountB <= tokenB.balanceOf(address(this)), "Not enough TokenB");

       tokenA.transfer(msg.sender, amountA);
       tokenB.transfer(msg.sender, amountB);

       emit LiquidityRemoved(msg.sender, amountA, amountB);
   }

   /// @notice Intercambia TokenA por TokenB a tasa fija 1:1
   function swapAforB(uint256 amountA) external {
       require(amountA > 0, "Amount must be > 0");
       require(tokenB.balanceOf(address(this)) >= amountA, "Insufficient TokenB liquidity");

       tokenA.transferFrom(msg.sender, address(this), amountA);
       tokenB.transfer(msg.sender, amountA);

       emit TokenSwapped(msg.sender, "AtoB", amountA, amountA);
   }

   /// @notice Intercambia TokenB por TokenA a tasa fija 1:1
   function swapBforA(uint256 amountB) external {
       require(amountB > 0, "Amount must be > 0");
       require(tokenA.balanceOf(address(this)) >= amountB, "Insufficient TokenA liquidity");

       tokenB.transferFrom(msg.sender, address(this), amountB);
       tokenA.transfer(msg.sender, amountB);

       emit TokenSwapped(msg.sender, "BtoA", amountB, amountB);
   }
}