/*
Copyright 2018 Binod Nirvan

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
 */

pragma solidity >=0.4.21 <0.6.0;

import "./Reclaimable.sol";

///@title Simple Token
///@author Binod Nirvan
///@notice Asset holder contract.
contract Holder is Reclaimable {
  using SafeMath for uint256;
  using SafeERC20 for ERC20;

  struct HoldingInfo {
    uint256 amount;
    uint256 releaseDate;
  }

  //token -> beneficiary -> info
  mapping(address => mapping(address=> HoldingInfo)) _holdings;

  ///@notice Deposit the tokens into this contract. Before using this function, you need to first approve this contract to receive the tokens.
  ///@return Returns true if the operation was successful.
  ///@param token The address of ERC20 token you want to deposit.
  ///@param releaseDate The timestamp in unix epoch when you want to be able to receive the funds back.
  function deposit(address token, uint256 releaseDate) external whenNotPaused returns(bool) {
    require(_holdings[token][msg.sender].amount == 0, "Sorry, you may only deposit a token once.");

    ERC20 erc20 = ERC20(token);
    uint256 allowance = erc20.allowance(msg.sender, address(this));

    require (allowance > 0, "You haven't approved any tokens for this contract to receive.");

    erc20.safeTransferFrom(msg.sender, address(this), allowance);

    _holdings[token][msg.sender].amount = _holdings[token][msg.sender].amount.add(allowance);
    _holdings[token][msg.sender].releaseDate = releaseDate;

    return false;
  }

  ///@notice Withdraw your tokens from this contract.
  ///@return Returns true if the operation was successful.
  ///@param token The address of ERC20 token you want to withdraw.
  ///@param amount The amount you want to withdraw.
  function withdraw(address token, uint256 amount) external whenNotPaused returns(bool) {
    HoldingInfo memory info = _holdings[token][msg.sender];
    uint256 available = releasableBalanceOf(info);
    require(available >= amount, "You don't have sufficient funds to transfer amount that large.");

    ERC20 erc20 = ERC20(token);

    _holdings[token][msg.sender].amount = _holdings[token][msg.sender].amount.sub(amount);

    erc20.safeTransfer(msg.sender, amount);

    return true;
  }

  ///@notice Get the balance of the ERC20 contract for the specified account.
  ///@return Returns the balance of the ERC20 token held by the account.
  ///@param token Address of the ERC20 contract.
  ///@param account The address of the account for which the balance is being requested.
  function tokenBalanceOf(address token, address account) external view returns(uint256) {
    return _holdings[token][account].amount;
  }

  ///@notice Get the locked balance of the ERC20 contract for the specified account.
  ///@return Returns the locked balance of the ERC20 token held by this account.
  ///@param token Address of the ERC20 contract.
  ///@param account The address of the account for which the locked balance is being requested.
  function lockedBalanceOf(address token, address account) external view returns(uint256) {
    return lockedBalanceOf(_holdings[token][account]);
  }

  ///@notice Get the releasable balance of the ERC20 contract for the specified account.
  ///@return Returns the releasable balance of the ERC20 token held by this account.
  ///@param token Address of the ERC20 contract.
  ///@param account The address of the account for which the releasable balance is being requested.
  function releasableBalanceOf(address token, address account) external view returns(uint256) {
    return releasableBalanceOf(_holdings[token][account]);
  }

  function releasableBalanceOf(HoldingInfo memory info) private view returns(uint256) {
    if(block.timestamp >= info.releaseDate) {
      return info.amount;
    }

    return 0;
  }

  function lockedBalanceOf(HoldingInfo memory info) private view returns(uint256) {
    if(info.releaseDate > block.timestamp) {
      return info.amount;
    }

    return 0;
  }
}