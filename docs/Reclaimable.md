# Reclaimable Contract (Reclaimable.sol)

View Source: [contracts/Reclaimable.sol](../contracts/Reclaimable.sol)

**↗ Extends: [CustomPausable](CustomPausable.md)**
**↘ Derived Contracts: [Holder](Holder.md)**

**Reclaimable**

Reclaimable contract enables the owner
to reclaim accidentally sent Ethers and ERC20 token(s)
to this contract.

## Functions

- [reclaimEther()](#reclaimether)
- [reclaimToken(address token)](#reclaimtoken)

### reclaimEther

Transfers all Ether held by the contract to the caller.

```js
function reclaimEther() external nonpayable whenNotPaused onlyOwner 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

### reclaimToken

Transfers all ERC20 tokens held by the contract to the caller.

```js
function reclaimToken(address token) external nonpayable whenNotPaused onlyOwner 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| token | address | The amount of token to reclaim. | 

## Contracts

* [Address](Address.md)
* [CustomAdmin](CustomAdmin.md)
* [CustomOwnable](CustomOwnable.md)
* [CustomPausable](CustomPausable.md)
* [ERC20](ERC20.md)
* [ERC20Detailed](ERC20Detailed.md)
* [ForceEther](ForceEther.md)
* [Holder](Holder.md)
* [IERC20](IERC20.md)
* [Migrations](Migrations.md)
* [Ownable](Ownable.md)
* [Reclaimable](Reclaimable.md)
* [SafeERC20](SafeERC20.md)
* [SafeMath](SafeMath.md)
* [SimpleToken](SimpleToken.md)
